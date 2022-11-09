part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchPokemonByName extends HomeEvent {
  late String pokemonName;

  SearchPokemonByName(this.pokemonName);

  @override
  List<Object> get props => [pokemonName];
}

class SetFavourite extends HomeEvent {
  late Pokemon pok;

  SetFavourite(this.pok);

  @override
  List<Object> get props => [pok, pok.id, pok.hashCode];
}

