import 'dart:convert';

import 'package:pockemon_cubit/models/extra_attributes_model..dart';

class Pokemon {
  Pokemon pokemonFromMap(String str) => Pokemon.fromMap(json.decode(str));
  String pokemonToMap(Pokemon data) => json.encode(data.toMap());

  Pokemon({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
    this.isFavourite = false,
  });

  final List<Ability> abilities;
  final int baseExperience;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<HeldItem> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;
  bool isFavourite = false;

  Pokemon copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    List<Species>? forms,
    List<GameIndex>? gameIndices,
    int? height,
    List<HeldItem>? heldItems,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
    bool? isFavourite,
  }) =>
      Pokemon(
        abilities: abilities ?? this.abilities,
        baseExperience: baseExperience ?? this.baseExperience,
        forms: forms ?? this.forms,
        gameIndices: gameIndices ?? this.gameIndices,
        height: height ?? this.height,
        heldItems: heldItems ?? this.heldItems,
        id: id ?? this.id,
        isDefault: isDefault ?? this.isDefault,
        locationAreaEncounters: locationAreaEncounters ?? this.locationAreaEncounters,
        moves: moves ?? this.moves,
        name: name ?? this.name,
        order: order ?? this.order,
        pastTypes: pastTypes ?? this.pastTypes,
        species: species ?? this.species,
        sprites: sprites ?? this.sprites,
        stats: stats ?? this.stats,
        types: types ?? this.types,
        weight: weight ?? this.weight,
        isFavourite: isFavourite ?? this.isFavourite,
      );

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromMap(x))),
    baseExperience: json["base_experience"],
    forms: List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
    gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromMap(x))),
    height: json["height"],
    heldItems: List<HeldItem>.from(json["held_items"].map((x) => HeldItem.fromMap(x))),
    id: json["id"],
    isDefault: json["is_default"],
    locationAreaEncounters: json["location_area_encounters"],
    moves: List<Move>.from(json["moves"].map((x) => Move.fromMap(x))),
    name: json["name"],
    order: json["order"],
    pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
    species: Species.fromMap(json["species"]),
    sprites: Sprites.fromMap(json["sprites"]),
    stats: List<Stat>.from(json["stats"].map((x) => Stat.fromMap(x))),
    types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
    weight: json["weight"],
    isFavourite: false,
  );

  Map<String, dynamic> toMap() => {
    "abilities": List<dynamic>.from(abilities.map((x) => x.toMap())),
    "base_experience": baseExperience,
    "forms": List<dynamic>.from(forms.map((x) => x.toMap())),
    "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toMap())),
    "height": height,
    "held_items": List<dynamic>.from(heldItems.map((x) => x.toMap())),
    "id": id,
    "is_default": isDefault,
    "location_area_encounters": locationAreaEncounters,
    "moves": List<dynamic>.from(moves.map((x) => x.toMap())),
    "name": name,
    "order": order,
    "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
    "species": species.toMap(),
    "sprites": sprites.toMap(),
    "stats": List<dynamic>.from(stats.map((x) => x.toMap())),
    "types": List<dynamic>.from(types.map((x) => x.toMap())),
    "weight": weight,
  };

  Map<String, String> toDetailsList() => {
    'id': id.toString(),
    'order': order.toString(),
    'baseExperience': baseExperience.toString(),
    'height': height.toString(),
    'weight': weight.toString(),
    'id2': id.toString(),
    'order2': order.toString(),
    'baseExperience2': baseExperience.toString(),
    'height2': height.toString(),
    'weight2': weight.toString(),
    'id3': id.toString(),
    'order3': order.toString(),
    'baseExperience3': baseExperience.toString(),
    'height3': height.toString(),
    'weight3': weight.toString(),
  };
}