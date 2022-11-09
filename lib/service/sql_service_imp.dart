import 'package:flutter/foundation.dart';
import 'package:pockemon_cubit/models/favourite_model.dart';
import 'package:pockemon_cubit/service/sql_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteServiceImp extends SqliteService {
  static const String databaseName = "favourites.db";
  static Database? db;

  static SqliteServiceImp initService() {
    return SqliteServiceImp._();
  }

  SqliteServiceImp._() {
    _initializeDb();
  }

  static Future<void> _initializeDb() async {
    if (db != null) {
      return;
    }
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await _createTables(db);
    });
  }

  static Future<void> _createTables(Database database) async {
    await database.execute(
        "CREATE TABLE Favourites(id INTEGER PRIMARY KEY, position INTEGER, imgUrl TEXT, name TEXT NOT NULL)");
  }

  @override
  Future<int?> addOrUpdateItem(Favourite fav) async {
    await _initializeDb();
    final id = await db?.insert('Favourites', fav.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  @override
  Future<List<Favourite>?> getItems() async {
    await _initializeDb();
    final List<Map<String, Object?>>? queryResult =
        await db?.query('Favourites');
    return queryResult?.map((e) => Favourite.fromMap(e)).toList();
  }

  @override
  Future<Favourite?> getSingleItem(int pokemonId) async {
    await _initializeDb();
    final List<Map<String, Object?>>? queryResult =
        await db?.query('Favourites', where: "id = ?", whereArgs: [pokemonId]);
    Iterable<Favourite>? it = queryResult?.map((e) => Favourite.fromMap(e));
    if (it != null && it.isNotEmpty) {
      return it.first;
    } else {
      return null;
    }
  }

  @override
  Future<void> deleteItem(int id) async {
    await _initializeDb();
    try {
      await db?.delete("Favourites", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
