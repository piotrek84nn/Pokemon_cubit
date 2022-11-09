import 'package:pockemon_cubit/models/pokemon_model.dart';

abstract class PokemonRepository {
  Future<Pokemon?> searchPokemonByName(String name);
}
