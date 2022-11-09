import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pockemon_cubit/bloc/favourite/favourite_bloc.dart';
import 'package:pockemon_cubit/mock_provider_setup.dart';
import 'package:pockemon_cubit/service/sql_service_mock.dart';
import 'package:pockemon_cubit/widgets/favourites/favourite_widget.dart';
import 'package:pockemon_cubit/widgets/favourites/reorderable_davourites_list.dart';
import 'package:provider/provider.dart';

void main() {
  SqliteServiceMock favouriteMock = SqliteServiceMock();
  favouriteMock.notFound = false;
  MultiProvider provider;

  testWidgets("InitialFavourite - state", (WidgetTester tester) async {
    FavouriteBloc favouriteBloc = FavouriteBloc(favouriteMock);
    provider = MultiProvider(
        providers: mock_providers,
        child: MaterialApp(
          home: BlocProvider(
              create: (context) => favouriteBloc, child: const FavouriteWidget()),
        ));
    favouriteBloc.emit(InitialFavourite());
    await tester.pumpWidget(provider);
    final count = tester
        .widgetList<ReorderableFavouritesList>(
            find.byType(ReorderableFavouritesList))
        .length;
    var appBar = find.byType(AppBar);
    var reordableList = find.byType(ReorderableFavouritesList);

    expect(appBar, findsOneWidget);
    expect(reordableList, findsOneWidget);
    expect(count, 1);
  });

  testWidgets("FavouritesLoaded - state", (WidgetTester tester) async {
    FavouriteBloc favouriteBloc = FavouriteBloc(favouriteMock);
    favouriteBloc.emit(FavouritesLoaded(favouriteMock.favList));
    provider = MultiProvider(
        providers: mock_providers,
        child: MaterialApp(
          home: BlocProvider(
              create: (context) => favouriteBloc, child: const FavouriteWidget()),
        ));

    await tester.pumpWidget(provider);
    final count = tester.widgetList<Card>(find.byType(Card)).length;
     expect(count, favouriteMock.favList.length);
  });

  testWidgets("FavouritesReload - state", (WidgetTester tester) async {
    FavouriteBloc favouriteBloc = FavouriteBloc(favouriteMock);
    favouriteBloc.emit(FavouritesLoaded(favouriteMock.favList));
    provider = MultiProvider(
        providers: mock_providers,
        child: MaterialApp(
          home: BlocProvider(
              create: (context) => favouriteBloc, child: const FavouriteWidget()),
        ));

    await tester.pumpWidget(provider);
    final count = tester.widgetList<Card>(find.byType(Card)).length;
    expect(count, favouriteMock.favList.length);
  });

}
