import 'package:flutter_test/flutter_test.dart';
import 'package:pockemon_cubit/bloc/home/home_bloc.dart';
import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_mock_repository.dart';

void main() {

  PokemonMockRepository repository = PokemonMockRepository();

  test('Initial props', () {
    expect(
      Initial().props,
      [],
    );
  });

  test('SearchPokemon props', () {
    expect(
      SearchPokemon().props,
      [],
    );
  });

  test('PokemonFounded props', () {
    expect(
      PokemonFounded(repository.pokemon).props,
      [
        repository.pokemon.hashCode,
        repository.pokemon.id
      ],
    );
  });

  test('PokemonNotFounded props', () {
    expect(
      const PokemonNotFounded().props,
      [
      ],
    );
  });
}
