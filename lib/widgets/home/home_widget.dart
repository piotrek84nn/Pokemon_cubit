import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pockemon_cubit/bloc/home/home_bloc.dart';
import 'package:pockemon_cubit/models/pokemon_model.dart';
import 'package:pockemon_cubit/widgets/favourites/favourite_widget.dart';
import 'package:provider/provider.dart';

import '../../bloc/favourite/favourite_bloc.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final TextEditingController patternCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon'),
          backgroundColor: Colors.blueAccent,
        ),
        floatingActionButton: FloatingActionButton.extended(
          foregroundColor: Colors.white,
          onPressed: () async {
            _goToFavourites();
          },
          icon: const Icon(Icons.list),
          label: const Text('Favourites'),
        ),
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is Initial) {
                return _getSearchInput(true);
              } else if (state is SearchPokemon) {
                return _searchForPokemon();
              } else if (state is PokemonFounded) {
                return _pokemonFounded(state.pokemon);
              } else {
                return _cantFindPokemon();
              }
            },
          ),
        ),
      ),
    );
  }

  Padding _getSearchInput(bool isEnable) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: patternCtrl,
        decoration: InputDecoration(
            labelText: "Search",
            enabled: isEnable,
            hintText: "Type pokemon name",
            suffixIcon: IconButton(
              onPressed: () async => patternCtrl.text.isNotEmpty
                  ? _searchPokemonByName(patternCtrl.text)
                  : null,
              icon: const Icon(Icons.search),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)))),
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  Column _searchForPokemon() {
    return Column(
      children: [
        _getSearchInput(false),
        const Expanded(child: Center(child: CircularProgressIndicator())),
      ],
    );
  }

  Widget _cantFindPokemon() {
    return Column(
      children: [
        _getSearchInput(true),
        const ListTile(
            contentPadding: EdgeInsets.only(left: 24, right: 8),
            title: Text('Can\'t find pokemon :(')),
      ],
    );
  }

  Widget _pokemonFounded(Pokemon pokemon) {
    return Column(
      children: [
        _getSearchInput(true),
        _getDetailsInfo(pokemon),
        _getPokemonDetailList(pokemon),
      ],
    );
  }

  Widget _getDetailsInfo(Pokemon pokemon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
      child: ListTile(
        leading: _getImageSection(pokemon),
        contentPadding: const EdgeInsets.only(left: 12, right: 16),
        tileColor: Colors.blueAccent,
        title: Text(pokemon.name.toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 20)),
        trailing: IconButton(
          onPressed: () async {
            await _setFavourite(pokemon);
            setState(() {});
          },
          icon: Icon(
              pokemon.isFavourite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white),
        ),
      ),
    );
  }

  Container _getImageSection(Pokemon pokemon) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blueAccent,
            width: 1,
          ),
        ),
        child: pokemon.sprites.frontDefault != null
            ? Image.network(
                pokemon.sprites.frontDefault!,
                fit: BoxFit.none,
                errorBuilder: (context, url, error) {
                  return const Icon(Icons.error);
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          const AlwaysStoppedAnimation(Colors.blueAccent),
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              )
            : const SizedBox());
  }

  Widget _getPokemonDetailList(Pokemon pokemon) {
    final Map<String, String> pokemonList = pokemon.toDetailsList();
    final List<String> pokemonListKeys = pokemonList.keys.toList();
    final List<String> pokemonListValues = pokemonList.values.toList();

    return Expanded(
      child: ListView.builder(
        itemCount: pokemonList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 60),
        itemBuilder: (context, index) {
          return Card(
              elevation: 6,
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                title: Text(
                    '${pokemonListKeys[index]}:     ${pokemonListValues[index]}'),
              ));
        },
      ),
    );
  }

  _searchPokemonByName(String name) {
    FocusScope.of(context).unfocus();
    BlocProvider.of<HomeBloc>(context).add(SearchPokemonByName(name));
  }

  Future<void> _setFavourite(Pokemon pok) async {
    patternCtrl.clear();
    FocusScope.of(context).unfocus();
    BlocProvider.of<HomeBloc>(context).add(SetFavourite(pok));
  }

  _goToFavourites() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider(
            create: (context) =>
                FavouriteBloc(Provider.of(context, listen: false)),
            child: const FavouriteWidget()),
      ),
    );
  }

  @override
  void dispose() {
    patternCtrl.dispose();
    super.dispose();
  }
}
