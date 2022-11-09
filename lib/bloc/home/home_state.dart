part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class Initial extends HomeState {}

class SearchPokemon extends HomeState {}

class PokemonFounded extends HomeState {
   final Pokemon pokemon;

   const PokemonFounded(this.pokemon);

  @override
  List<Object> get props => [pokemon.hashCode, pokemon.id];
}

class PokemonNotFounded extends HomeState {
  const PokemonNotFounded();
}
