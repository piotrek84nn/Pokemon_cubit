import 'package:pockemon_cubit/models/favourite_model.dart';

abstract class SqliteService {
  Future<int?> addOrUpdateItem(Favourite fav);
  Future<List<Favourite>?> getItems();
  Future<Favourite?> getSingleItem(int pokemonId);
  Future<void> deleteItem(int id);
}