

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_image.freezed.dart';
part 'character_image.g.dart';

@freezed
class CharacterImage with _$CharacterImage {
  @JsonSerializable(fieldRename: FieldRename.kebab)
  const factory CharacterImage({
    @Default("") String headShot,
    required String main
  }) = _CharacterImage;


  factory CharacterImage.fromJson(Map<String, dynamic> json) =>
      _$CharacterImageFromJson(json);
}