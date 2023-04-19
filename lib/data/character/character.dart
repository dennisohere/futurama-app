
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:futurama/data/character/character_image.dart';

import 'character_name.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const Character._();

  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Character({
    required int id,
    required CharacterName name,
    required CharacterImage images,
    required String age,
    required String gender,
    required String species,
    @Default("") String homePlanet,
    required String occupation,
    required List<String> sayings,

  }) = _Character;



  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);


  String get fullName {
    String fullName = "";

    if(name.first.isNotEmpty) fullName += "${name.first} ";
    if(name.middle.isNotEmpty) fullName += "${name.middle} ";
    if(name.last.isNotEmpty) fullName += name.last;

    return fullName;
  }
}

