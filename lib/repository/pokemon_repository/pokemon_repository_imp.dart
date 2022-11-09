import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pockemon_cubit/models/pokemon_model.dart';
import 'package:pockemon_cubit/repository/pokemon_repository/pokemon_repository.dart';

class PokemonRepositoryImp extends PokemonRepository {
  final _endpoint = 'pokeapi.co';

  PokemonRepositoryImp({required this.client});

  final http.Client client;

  @override
  Future<Pokemon?> searchPokemonByName(String name) async{
    Pokemon? pokemonResponse;
    Uri url = Uri.https(_endpoint, '/api/v2/pokemon/${name.toLowerCase()}');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      pokemonResponse = Pokemon.fromMap(json.decode(response.body));
    }
    return pokemonResponse;
  }
}
