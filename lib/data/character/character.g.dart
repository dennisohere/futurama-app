// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Character _$$_CharacterFromJson(Map<String, dynamic> json) => _$_Character(
      id: json['id'] as int,
      name: CharacterName.fromJson(json['name'] as Map<String, dynamic>),
      images: CharacterImage.fromJson(json['images'] as Map<String, dynamic>),
      age: json['age'] as String,
      gender: json['gender'] as String,
      species: json['species'] as String,
      homePlanet: json['homePlanet'] as String? ?? "",
      occupation: json['occupation'] as String,
      sayings:
          (json['sayings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_CharacterToJson(_$_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
      'age': instance.age,
      'gender': instance.gender,
      'species': instance.species,
      'homePlanet': instance.homePlanet,
      'occupation': instance.occupation,
      'sayings': instance.sayings,
    };
