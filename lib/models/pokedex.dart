import 'ability.dart';
import 'form.dart';
import 'game_index.dart';
import 'move.dart';
import 'species.dart';
import 'sprites.dart';
import 'stat.dart';
import 'type.dart';

class Pokedex {
  List<Ability>? abilities;
  int? baseExperience;
  List<Form>? forms;
  List<GameIndex>? gameIndices;
  int? height;
  List<dynamic>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Move>? moves;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  Pokedex({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        abilities: (json['abilities'] as List<dynamic>?)
            ?.map((e) => Ability.fromJson(e as Map<String, dynamic>))
            .toList(),
        baseExperience: json['base_experience'] as int?,
        forms: (json['forms'] as List<dynamic>?)
            ?.map((e) => Form.fromJson(e as Map<String, dynamic>))
            .toList(),
        gameIndices: (json['game_indices'] as List<dynamic>?)
            ?.map((e) => GameIndex.fromJson(e as Map<String, dynamic>))
            .toList(),
        height: json['height'] as int?,
        heldItems: json['held_items'] as List<dynamic>?,
        id: json['id'] as int?,
        isDefault: json['is_default'] as bool?,
        locationAreaEncounters: json['location_area_encounters'] as String?,
        moves: (json['moves'] as List<dynamic>?)
            ?.map((e) => Move.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        order: json['order'] as int?,
        pastTypes: json['past_types'] as List<dynamic>?,
        species: json['species'] == null
            ? null
            : Species.fromJson(json['species'] as Map<String, dynamic>),
        sprites: json['sprites'] == null
            ? null
            : Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
        stats: (json['stats'] as List<dynamic>?)
            ?.map((e) => Stat.fromJson(e as Map<String, dynamic>))
            .toList(),
        types: (json['types'] as List<dynamic>?)
            ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
            .toList(),
        weight: json['weight'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'abilities': abilities?.map((e) => e.toJson()).toList(),
        'base_experience': baseExperience,
        'forms': forms?.map((e) => e.toJson()).toList(),
        'game_indices': gameIndices?.map((e) => e.toJson()).toList(),
        'height': height,
        'held_items': heldItems,
        'id': id,
        'is_default': isDefault,
        'location_area_encounters': locationAreaEncounters,
        'moves': moves?.map((e) => e.toJson()).toList(),
        'name': name,
        'order': order,
        'past_types': pastTypes,
        'species': species?.toJson(),
        'sprites': sprites?.toJson(),
        'stats': stats?.map((e) => e.toJson()).toList(),
        'types': types?.map((e) => e.toJson()).toList(),
        'weight': weight,
      };
}
