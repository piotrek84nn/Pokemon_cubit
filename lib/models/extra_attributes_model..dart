class Ability {
  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final Species ability;
  final bool isHidden;
  final int slot;

  Ability copyWith({
    Species? ability,
    bool? isHidden,
    int? slot,
  }) =>
      Ability(
        ability: ability ?? this.ability,
        isHidden: isHidden ?? this.isHidden,
        slot: slot ?? this.slot,
      );

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
    ability: Species.fromMap(json["ability"]),
    isHidden: json["is_hidden"],
    slot: json["slot"],
  );

  Map<String, dynamic> toMap() => {
    "ability": ability.toMap(),
    "is_hidden": isHidden,
    "slot": slot,
  };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  Species copyWith({
    String? name,
    String? url,
  }) =>
      Species(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Species.fromMap(Map<String, dynamic> json) => Species(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "url": url,
  };
}

class GameIndex {
  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  final int gameIndex;
  final Species version;

  GameIndex copyWith({
    int? gameIndex,
    Species? version,
  }) =>
      GameIndex(
        gameIndex: gameIndex ?? this.gameIndex,
        version: version ?? this.version,
      );

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
    gameIndex: json["game_index"],
    version: Species.fromMap(json["version"]),
  );

  Map<String, dynamic> toMap() => {
    "game_index": gameIndex,
    "version": version.toMap(),
  };
}

class HeldItem {
  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  final Species item;
  final List<VersionDetail> versionDetails;

  HeldItem copyWith({
    Species? item,
    List<VersionDetail>? versionDetails,
  }) =>
      HeldItem(
        item: item ?? this.item,
        versionDetails: versionDetails ?? this.versionDetails,
      );

  factory HeldItem.fromMap(Map<String, dynamic> json) => HeldItem(
    item: Species.fromMap(json["item"]),
    versionDetails: List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "item": item.toMap(),
    "version_details": List<dynamic>.from(versionDetails.map((x) => x.toMap())),
  };
}

class VersionDetail {
  VersionDetail({
    required this.rarity,
    required this.version,
  });

  final int rarity;
  final Species version;

  VersionDetail copyWith({
    int? rarity,
    Species? version,
  }) =>
      VersionDetail(
        rarity: rarity ?? this.rarity,
        version: version ?? this.version,
      );

  factory VersionDetail.fromMap(Map<String, dynamic> json) => VersionDetail(
    rarity: json["rarity"],
    version: Species.fromMap(json["version"]),
  );

  Map<String, dynamic> toMap() => {
    "rarity": rarity,
    "version": version.toMap(),
  };
}

class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  final Species move;
  final List<VersionGroupDetail> versionGroupDetails;

  Move copyWith({
    Species? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) =>
      Move(
        move: move ?? this.move,
        versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
      );

  factory Move.fromMap(Map<String, dynamic> json) => Move(
    move: Species.fromMap(json["move"]),
    versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "move": move.toMap(),
    "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toMap())),
  };
}

class VersionGroupDetail {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  final int levelLearnedAt;
  final Species moveLearnMethod;
  final Species versionGroup;

  VersionGroupDetail copyWith({
    int? levelLearnedAt,
    Species? moveLearnMethod,
    Species? versionGroup,
  }) =>
      VersionGroupDetail(
        levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
        moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
        versionGroup: versionGroup ?? this.versionGroup,
      );

  factory VersionGroupDetail.fromMap(Map<String, dynamic> json) => VersionGroupDetail(
    levelLearnedAt: json["level_learned_at"],
    moveLearnMethod: Species.fromMap(json["move_learn_method"]),
    versionGroup: Species.fromMap(json["version_group"]),
  );

  Map<String, dynamic> toMap() => {
    "level_learned_at": levelLearnedAt,
    "move_learn_method": moveLearnMethod.toMap(),
    "version_group": versionGroup.toMap(),
  };
}

class GenerationV {
  GenerationV({
    required this.blackWhite,
  });

  final Sprites blackWhite;

  GenerationV copyWith({
    Sprites? blackWhite,
  }) =>
      GenerationV(
        blackWhite: blackWhite ?? this.blackWhite,
      );

  factory GenerationV.fromMap(Map<String, dynamic> json) => GenerationV(
    blackWhite: Sprites.fromMap(json["black-white"]),
  );

  Map<String, dynamic> toMap() => {
    "black-white": blackWhite.toMap(),
  };
}

class GenerationIv {
  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  final Sprites diamondPearl;
  final Sprites heartgoldSoulsilver;
  final Sprites platinum;

  GenerationIv copyWith({
    Sprites? diamondPearl,
    Sprites? heartgoldSoulsilver,
    Sprites? platinum,
  }) =>
      GenerationIv(
        diamondPearl: diamondPearl ?? this.diamondPearl,
        heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
        platinum: platinum ?? this.platinum,
      );

  factory GenerationIv.fromMap(Map<String, dynamic> json) => GenerationIv(
    diamondPearl: Sprites.fromMap(json["diamond-pearl"]),
    heartgoldSoulsilver: Sprites.fromMap(json["heartgold-soulsilver"]),
    platinum: Sprites.fromMap(json["platinum"]),
  );

  Map<String, dynamic> toMap() => {
    "diamond-pearl": diamondPearl.toMap(),
    "heartgold-soulsilver": heartgoldSoulsilver.toMap(),
    "platinum": platinum.toMap(),
  };
}

class Versions {
  Versions({
    required this.generationI,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  final GenerationI generationI;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final Map<String, Home> generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  Versions copyWith({
    GenerationI? generationI,
    GenerationIv? generationIv,
    GenerationV? generationV,
    Map<String, Home>? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) =>
      Versions(
        generationI: generationI ?? this.generationI,
        generationIv: generationIv ?? this.generationIv,
        generationV: generationV ?? this.generationV,
        generationVi: generationVi ?? this.generationVi,
        generationVii: generationVii ?? this.generationVii,
        generationViii: generationViii ?? this.generationViii,
      );

  factory Versions.fromMap(Map<String, dynamic> json) => Versions(
    generationI: GenerationI.fromMap(json["generation-i"]),
    generationIv: GenerationIv.fromMap(json["generation-iv"]),
    generationV: GenerationV.fromMap(json["generation-v"]),
    generationVi: Map.from(json["generation-vi"]).map((k, v) => MapEntry<String, Home>(k, Home.fromMap(v))),
    generationVii: GenerationVii.fromMap(json["generation-vii"]),
    generationViii: GenerationViii.fromMap(json["generation-viii"]),
  );

  Map<String, dynamic> toMap() => {
    "generation-i": generationI.toMap(),
    "generation-iv": generationIv.toMap(),
    "generation-v": generationV.toMap(),
    "generation-vi": Map.from(generationVi).map((k, v) => MapEntry<String, dynamic>(k, v.toMap())),
    "generation-vii": generationVii.toMap(),
    "generation-viii": generationViii.toMap(),
  };
}

class Sprites {
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
    required this.animated,
  });

  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String? frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final Other? other;
  final Versions? versions;
  final Sprites? animated;

  Sprites copyWith({
    String? backDefault,
    dynamic backFemale,
    String? backShiny,
    dynamic backShinyFemale,
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
    Other? other,
    Versions? versions,
    Sprites? animated,
  }) =>
      Sprites(
        backDefault: backDefault ?? this.backDefault,
        backFemale: backFemale ?? this.backFemale,
        backShiny: backShiny ?? this.backShiny,
        backShinyFemale: backShinyFemale ?? this.backShinyFemale,
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
        other: other ?? this.other,
        versions: versions ?? this.versions,
        animated: animated ?? this.animated,
      );

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
    backDefault: json["back_default"],
    backFemale: json["back_female"],
    backShiny: json["back_shiny"],
    backShinyFemale: json["back_shiny_female"],
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
    other: json["other"] == null ? null : Other.fromMap(json["other"]),
    versions: json["versions"] == null ? null : Versions.fromMap(json["versions"]),
    animated: json["animated"] == null ? null : Sprites.fromMap(json["animated"]),
  );

  Map<String, dynamic> toMap() => {
    "back_default": backDefault,
    "back_female": backFemale,
    "back_shiny": backShiny,
    "back_shiny_female": backShinyFemale,
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
    "other": other == null ? null : other?.toMap(),
    "versions": versions == null ? null : versions?.toMap(),
    "animated": animated == null ? null : animated?.toMap(),
  };
}

class GenerationI {
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  final RedBlue redBlue;
  final RedBlue yellow;

  GenerationI copyWith({
    RedBlue? redBlue,
    RedBlue? yellow,
  }) =>
      GenerationI(
        redBlue: redBlue ?? this.redBlue,
        yellow: yellow ?? this.yellow,
      );

  factory GenerationI.fromMap(Map<String, dynamic> json) => GenerationI(
    redBlue: RedBlue.fromMap(json["red-blue"]),
    yellow: RedBlue.fromMap(json["yellow"]),
  );

  Map<String, dynamic> toMap() => {
    "red-blue": redBlue.toMap(),
    "yellow": yellow.toMap(),
  };
}

class RedBlue {
  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  final String backDefault;
  final String backGray;
  final String backTransparent;
  final String frontDefault;
  final String frontGray;
  final String frontTransparent;

  RedBlue copyWith({
    String? backDefault,
    String? backGray,
    String? backTransparent,
    String? frontDefault,
    String? frontGray,
    String? frontTransparent,
  }) =>
      RedBlue(
        backDefault: backDefault ?? this.backDefault,
        backGray: backGray ?? this.backGray,
        backTransparent: backTransparent ?? this.backTransparent,
        frontDefault: frontDefault ?? this.frontDefault,
        frontGray: frontGray ?? this.frontGray,
        frontTransparent: frontTransparent ?? this.frontTransparent,
      );

  factory RedBlue.fromMap(Map<String, dynamic> json) => RedBlue(
    backDefault: json["back_default"],
    backGray: json["back_gray"],
    backTransparent: json["back_transparent"],
    frontDefault: json["front_default"],
    frontGray: json["front_gray"],
    frontTransparent: json["front_transparent"],
  );

  Map<String, dynamic> toMap() => {
    "back_default": backDefault,
    "back_gray": backGray,
    "back_transparent": backTransparent,
    "front_default": frontDefault,
    "front_gray": frontGray,
    "front_transparent": frontTransparent,
  };
}

class Emerald {
  Emerald({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String frontDefault;
  final String frontShiny;

  Emerald copyWith({
    String? frontDefault,
    String? frontShiny,
  }) =>
      Emerald(
        frontDefault: frontDefault ?? this.frontDefault,
        frontShiny: frontShiny ?? this.frontShiny,
      );

  factory Emerald.fromMap(Map<String, dynamic> json) => Emerald(
    frontDefault: json["front_default"],
    frontShiny: json["front_shiny"],
  );

  Map<String, dynamic> toMap() => {
    "front_default": frontDefault,
    "front_shiny": frontShiny,
  };
}

class Home {
  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  Home copyWith({
    String? frontDefault,
    dynamic frontFemale,
    String? frontShiny,
    dynamic frontShinyFemale,
  }) =>
      Home(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        frontShiny: frontShiny ?? this.frontShiny,
        frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      );

  factory Home.fromMap(Map<String, dynamic> json) => Home(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
    frontShiny: json["front_shiny"],
    frontShinyFemale: json["front_shiny_female"],
  );

  Map<String, dynamic> toMap() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
    "front_shiny": frontShiny,
    "front_shiny_female": frontShinyFemale,
  };
}

class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  final DreamWorld icons;
  final Home ultraSunUltraMoon;

  GenerationVii copyWith({
    DreamWorld? icons,
    Home? ultraSunUltraMoon,
  }) =>
      GenerationVii(
        icons: icons ?? this.icons,
        ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
      );

  factory GenerationVii.fromMap(Map<String, dynamic> json) => GenerationVii(
    icons: DreamWorld.fromMap(json["icons"]),
    ultraSunUltraMoon: Home.fromMap(json["ultra-sun-ultra-moon"]),
  );

  Map<String, dynamic> toMap() => {
    "icons": icons.toMap(),
    "ultra-sun-ultra-moon": ultraSunUltraMoon.toMap(),
  };
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  final String frontDefault;
  final dynamic frontFemale;

  DreamWorld copyWith({
    String? frontDefault,
    dynamic frontFemale,
  }) =>
      DreamWorld(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
      );

  factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
    frontDefault: json["front_default"],
    frontFemale: json["front_female"],
  );

  Map<String, dynamic> toMap() => {
    "front_default": frontDefault,
    "front_female": frontFemale,
  };
}

class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  final DreamWorld icons;

  GenerationViii copyWith({
    DreamWorld? icons,
  }) =>
      GenerationViii(
        icons: icons ?? this.icons,
      );

  factory GenerationViii.fromMap(Map<String, dynamic> json) => GenerationViii(
    icons: DreamWorld.fromMap(json["icons"]),
  );

  Map<String, dynamic> toMap() => {
    "icons": icons.toMap(),
  };
}

class Other {
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
  }) =>
      Other(
        dreamWorld: dreamWorld ?? this.dreamWorld,
        home: home ?? this.home,
        officialArtwork: officialArtwork ?? this.officialArtwork,
      );

  factory Other.fromMap(Map<String, dynamic> json) => Other(
    dreamWorld: DreamWorld.fromMap(json["dream_world"]),
    home: Home.fromMap(json["home"]),
    officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
  );

  Map<String, dynamic> toMap() => {
    "dream_world": dreamWorld.toMap(),
    "home": home.toMap(),
    "official-artwork": officialArtwork.toMap(),
  };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
  });

  final String frontDefault;

  OfficialArtwork copyWith({
    String? frontDefault,
  }) =>
      OfficialArtwork(
        frontDefault: frontDefault ?? this.frontDefault,
      );

  factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
    frontDefault: json["front_default"],
  );

  Map<String, dynamic> toMap() => {
    "front_default": frontDefault,
  };
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int baseStat;
  final int effort;
  final Species stat;

  Stat copyWith({
    int? baseStat,
    int? effort,
    Species? stat,
  }) =>
      Stat(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  factory Stat.fromMap(Map<String, dynamic> json) => Stat(
    baseStat: json["base_stat"],
    effort: json["effort"],
    stat: Species.fromMap(json["stat"]),
  );

  Map<String, dynamic> toMap() => {
    "base_stat": baseStat,
    "effort": effort,
    "stat": stat.toMap(),
  };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final Species type;

  Type copyWith({
    int? slot,
    Species? type,
  }) =>
      Type(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  factory Type.fromMap(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromMap(json["type"]),
  );

  Map<String, dynamic> toMap() => {
    "slot": slot,
    "type": type.toMap(),
  };
}
