import 'package:flutter_test/flutter_test.dart';
import 'package:pockemon_cubit/bloc/favourite/favourite_bloc.dart';
import 'package:pockemon_cubit/service/sql_service_mock.dart';
import 'package:bloc_test/bloc_test.dart';

Future<void> main() async {
  SqliteServiceMock sqlMock = SqliteServiceMock();
  FavouriteBloc cubit = FavouriteBloc(sqlMock);
  final cubitInitalState =  InitialFavourite();

  group('FavouriteBloc tests', () {
    blocTest(
      'FavouriteBloc - Initialize()',
      build: () {
        return cubit;
      },
      act: (FavouriteBloc cubit) async {
        cubit.emit(InitialFavourite());
      },
      expect: () => [
        cubitInitalState
      ],
    );

    blocTest(
      'FavouriteBloc - Load Favourites',
      build: () {
        sqlMock.notFound = false;
        cubit = FavouriteBloc(
            sqlMock
        );
        return cubit;
      },
      act: (FavouriteBloc cubit)  {
        cubit.add(const LoadFavourites());
      },
      expect: () => [
        cubitInitalState,
        FavouritesLoaded(sqlMock.favList)
      ],
    );

    blocTest(
      'FavouriteBloc - Load Favourites Empty List',
      build: () {
        sqlMock.notFound = true;
        cubit = FavouriteBloc(
            sqlMock
        );
        return cubit;
      },
      act: (FavouriteBloc cubit)  {
        cubit.add(const LoadFavourites());
      },
      expect: () => [
        cubitInitalState,
      ],
    );

    blocTest(
      'FavouriteBloc - Reorder Items On List 1 -> 2',
      build: () {
        sqlMock.notFound = false;
        cubit = FavouriteBloc(
            sqlMock
        );
        return cubit;
      },
      act: (FavouriteBloc cubit)  {
        cubit.add(const LoadFavourites());
        cubit.add(ReorderItemsOnList(1, 2));
      },
      expect: () => [
        cubitInitalState,
        FavouritesLoaded(sqlMock.favList),
      ],
    );
  });
}
