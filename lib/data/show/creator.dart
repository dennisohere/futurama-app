
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'creator.freezed.dart';
part 'creator.g.dart';

@freezed
class Creator with _$Creator {
  const factory Creator({
    required String name,
    required String url
  }) = _Creator;



  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);
}