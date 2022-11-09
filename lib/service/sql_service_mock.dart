import 'package:pockemon_cubit/models/favourite_model.dart';
import 'package:pockemon_cubit/service/sql_service.dart';

class SqliteServiceMock extends SqliteService{

  final List<Favourite> _favouriteList = [
    Favourite(id: 1, position: 0, imgUrl: 'MockImgUrl1', name: 'pokemon 1'),
    Favourite(id: 2, position: 1, imgUrl: 'MockImgUrl2', name: 'pokemon 2'),
    Favourite(id: 3, position: 2, imgUrl: 'MockImgUrl3', name: 'pokemon 3'),
    Favourite(id: 4, position: 3, imgUrl: 'MockImgUrl4', name: 'pokemon 4'),
    Favourite(id: 5, position: 4, imgUrl: 'MockImgUrl5', name: 'pokemon 5'),
  ];

  List<Favourite> get favList => _favouriteList;
  bool notFound = true;

  @override
  Future<int?> addOrUpdateItem(Favourite fav) async {
    return 1;
  }

  @override
  Future<List<Favourite>?> getItems() async {
    if(notFound) {
      return null;
    } else {
      return _favouriteList;
    }
  }

  @override
  Future<Favourite?> getSingleItem(int pokemonId) async {
    if(notFound) {
      return null;
    } else {
      return _favouriteList.first;
    }
  }

  @override
  Future<void> deleteItem(int id) async {
  }
}
