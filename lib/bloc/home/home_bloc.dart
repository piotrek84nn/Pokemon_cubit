import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pockemon_cubit/models/favourite_model.dart';
import 'package:pockemon_cubit/models/pokemon_model.dart';
import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_repository.dart';
import 'package:pockemon_cubit/service/sql_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PokemonRepository repository;
  final SqliteService sqlService;

  HomeBloc(this.repository, this.sqlService) : super(Initial()) {
    on<HomeEvent>((event, emit) async {
      if (event is SearchPokemonByName) {
        await _setFavourite(emit, event);
      } else if (event is SetFavourite) {
        await _saveFavourite(event);
      }
    });
  }

  Future<void> _setFavourite(Emitter<HomeState> emit, SearchPokemonByName event) async {
    emit(SearchPokemon());
    final pokemon = await repository.searchPokemonByName(event.pokemonName);
    if (pokemon != null) {
      Favourite? fav = await sqlService.getSingleItem(pokemon.id);
      if(fav != null) {
        pokemon.isFavourite = true;
      }
      emit(PokemonFounded(pokemon));
    } else {
      emit(const PokemonNotFounded());
    }
  }

  Future<void> _saveFavourite(SetFavourite event) async {
    Pokemon favPokemon = event.pok;
    favPokemon.isFavourite = !favPokemon.isFavourite;
    if (favPokemon.isFavourite) {
      await sqlService.addOrUpdateItem(Favourite(
          imgUrl: favPokemon.sprites.frontDefault ?? '',
          position: double.maxFinite.toInt(),
          name: favPokemon.name,
          id: favPokemon.id));
    } else {
      await sqlService.deleteItem(favPokemon.id);
    }
  }
}
