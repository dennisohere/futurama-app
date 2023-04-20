import 'package:futurama/data/quiz/quiz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'http_service.dart';

final quizServiceProvider = Provider((ref) => _QuizService(ref: ref));

final correctAnswersProvider = StateProvider<List<Quiz>>((ref) => []);
final incorrectAnswersProvider = StateProvider<List<Quiz>>((ref) => []);


class _QuizService {
  Ref ref;

  _QuizService({required this.ref});


  Future<List<Quiz>> getQuiz() async {
    ref.refresh(incorrectAnswersProvider);
    ref.refresh(correctAnswersProvider);

    final response = await ref.read(
      httpServiceProvider(
        ApiRequestModel(
          url: 'questions',
        ),
      ),
    );

    final quizResponse = response.data as List;

    return quizResponse.map((data) => Quiz.fromJson(data)).toList();
  }

}