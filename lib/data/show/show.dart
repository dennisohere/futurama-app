
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'creator.dart';

part 'show.freezed.dart';
part 'show.g.dart';

@freezed
class Show with _$Show {
  const Show._();

  const factory Show({
    required String yearsAired,
    required String synopsis,
    required int id,
    @Default([]) List<Creator> creators,
  }) = _Show;



  factory Show.fromJson(Map<String, dynamic> json) =>
      _$ShowFromJson(json);


  String get excerpt {
    const _maxText = 150;

    if(synopsis.length <= _maxText){
      return synopsis;
    }
    return '${synopsis.substring(0, _maxText)}...';
  }
}