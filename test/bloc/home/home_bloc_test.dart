import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pockemon_cubit/bloc/home/home_bloc.dart';
import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_mock_repository.dart';
import 'package:pockemon_cubit/service/sql_service_mock.dart';

import 'package:bloc_test/bloc_test.dart';

Future<void> main() async {
  PokemonMockRepository pokemonMock = PokemonMockRepository();
  SqliteServiceMock sqlMock = SqliteServiceMock();
  HomeBloc cubit = HomeBloc(
      pokemonMock, sqlMock
  );
  final cubitInitalState =  Initial();
  final cubitSearchPokemon = SearchPokemon();

  group('HomeBloc tests', () {

    blocTest(
      'HomeBloc - Initialize()',
      build: () {
        return cubit;
      },
      act: (HomeBloc cubit) async {
        cubit.emit(Initial());
      },
      expect: () => [
        cubitInitalState
      ],
    );

    blocTest(
      'HomeBloc - SearchPokemonByName - Founded',
      build: () {
        pokemonMock.notFound = false;
        cubit = HomeBloc(
            pokemonMock, sqlMock
        );
        return cubit;
      },
      act: (HomeBloc cubit)  {
        cubit.add(SearchPokemonByName('Pokemon 1'));
      },
      expect: () => [
        cubitSearchPokemon,
        PokemonFounded(pokemonMock.pokemon)
      ],
    );

    blocTest(
      'HomeBloc - SearchPokemonByName - Not Found',
      build: () {
        pokemonMock.notFound = true;
        cubit = HomeBloc(
            pokemonMock, sqlMock
        );
        return cubit;
      },
      act: (HomeBloc cubit)  {
        cubit.add(SearchPokemonByName('Pokemon 1'));
      },
      expect: () => [
        cubitSearchPokemon,
        const PokemonNotFounded()
      ],
    );

    blocTest(
      'HomeBloc - SetFavourite',
      build: () {
        pokemonMock.notFound = false;
        cubit = HomeBloc(
            pokemonMock, sqlMock
        );
        return cubit;
      },
      act: (HomeBloc cubit)  {
        cubit.add(SetFavourite(pokemonMock.pokemon));
      },
      expect: () => [
      ],
    );
  });
}
