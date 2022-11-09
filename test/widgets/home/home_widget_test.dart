import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pockemon_cubit/bloc/home/home_bloc.dart';
import 'package:pockemon_cubit/mock_provider_setup.dart';
import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_mock_repository.dart';
import 'package:pockemon_cubit/service/sql_service_mock.dart';
import 'package:pockemon_cubit/widgets/home/home_widget.dart';
import 'package:provider/provider.dart';

void main() {
  PokemonMockRepository pokemonRepository = PokemonMockRepository();
  SqliteServiceMock favouriteMock = SqliteServiceMock();
  HomeBloc homeBloc = HomeBloc(pokemonRepository, favouriteMock);
  MultiProvider provider;

  testWidgets('Initial state test', (WidgetTester tester) async {
    provider = MultiProvider(
        providers: mock_providers,
        child: MaterialApp(
          home: BlocProvider(
              create: (context) => homeBloc, child: const HomeWidget()),
        ));
    homeBloc = HomeBloc(pokemonRepository, favouriteMock);
    homeBloc.emit(Initial());
    await tester.pumpWidget(provider);
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    var floatingActionBtn = find.byType(FloatingActionButton);
    expect(floatingActionBtn, findsOneWidget);

    var appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
  });

  testWidgets('SearchPokemon - state test', (WidgetTester tester) async {
    homeBloc = HomeBloc(pokemonRepository, favouriteMock);
    provider = MultiProvider(
        providers: mock_providers,
        child: MaterialApp(
          home: BlocProvider(
              create: (context) => homeBloc, child: const HomeWidget()),
        ));
    homeBloc.emit(SearchPokemon());
    await tester.pumpWidget(provider);

    var progress = find.byType(CircularProgressIndicator);
    expect(progress, findsOneWidget);
  });

  testWidgets('PokemonNotFounded - state test', (WidgetTester tester) async {
    homeBloc = HomeBloc(pokemonRepository, favouriteMock);
    provider = MultiProvider(
        providers: mock_providers,
        child: MaterialApp(
          home: BlocProvider(
              create: (context) => homeBloc, child: const HomeWidget()),
        ));
    homeBloc.emit(const PokemonNotFounded());
    await tester.pumpWidget(provider);

    expect(find.text('Can\'t find pokemon :('), findsOneWidget);
  });

  testWidgets('PokemonFounded - state test', (WidgetTester tester) async {
    homeBloc = HomeBloc(pokemonRepository, favouriteMock);
    provider = MultiProvider(
        providers: mock_providers,
        child: MaterialApp(
          home: BlocProvider(
              create: (context) => homeBloc, child: const HomeWidget()),
        ));
    homeBloc.emit(PokemonFounded(PokemonMockRepository().pokemon));
    await tester.pumpWidget(provider);

    expect(find.text('DITTO'), findsOneWidget);
    expect(find.text('id:     132'), findsOneWidget);
    expect(find.text('order:     214'), findsOneWidget);
  });
}
