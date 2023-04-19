// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Show _$$_ShowFromJson(Map<String, dynamic> json) => _$_Show(
      yearsAired: json['yearsAired'] as String,
      synopsis: json['synopsis'] as String,
      id: json['id'] as int,
      creators: (json['creators'] as List<dynamic>?)
              ?.map((e) => Creator.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ShowToJson(_$_Show instance) => <String, dynamic>{
      'yearsAired': instance.yearsAired,
      'synopsis': instance.synopsis,
      'id': instance.id,
      'creators': instance.creators,
    };
