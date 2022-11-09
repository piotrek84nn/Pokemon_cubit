import 'package:flutter_test/flutter_test.dart';
import 'package:pockemon_cubit/bloc/favourite/favourite_bloc.dart';
import 'package:pockemon_cubit/models/favourite_model.dart';
import 'package:pockemon_cubit/service/sql_service_mock.dart';

void main() {
  SqliteServiceMock sqlMock = SqliteServiceMock();
  test('InitialFavourite props', () {
    expect(
      InitialFavourite()
          .props,
      [
      <Favourite>[],
      ],
    );
  });

  test('FavouritesLoaded props', () {
    expect(
      FavouritesLoaded(sqlMock.favList)
          .props,
      [
        sqlMock.favList,
      ],
    );
  });
}
