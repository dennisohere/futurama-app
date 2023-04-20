
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {

  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Quiz({
    required int id,
    required String question,
    required List<String> possibleAnswers,
    required dynamic correctAnswer,
  }) = _Quiz;



  factory Quiz.fromJson(Map<String, dynamic> json) =>
      _$QuizFromJson(json);
}