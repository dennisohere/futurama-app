import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:futurama/components/future_data_loader.dart';
import 'package:futurama/components/quiz_question_page.dart';
import 'package:futurama/data/quiz/quiz.dart';
import 'package:futurama/screens/layout/app_layout.dart';
import 'package:futurama/services/navigation_service.dart';
import 'package:futurama/services/quiz_service.dart';
import 'package:futurama/utils/route_paths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TakeQuizScreen extends ConsumerStatefulWidget {
  const TakeQuizScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<TakeQuizScreen> createState() => _TakeQuizScreenState();
}

class _TakeQuizScreenState extends ConsumerState<TakeQuizScreen> {
  late final Future questionsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionsFuture = ref.read(quizServiceProvider).getQuiz();
  }

  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: FutureDataLoader(
        future: questionsFuture,
        onDataLoaded: (data) {
          final quizQuestions = data as List<Quiz>;

          return PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ...quizQuestions.asMap().map((index, question) =>
                  MapEntry(index, QuizQuestionPage(
                    quiz: question,
                    currentPage: index + 1,
                    totalPages: quizQuestions.length,
                    onPageSubmitted: () {
                      if(index + 1 == quizQuestions.length){
                        NavigationService().navigateTo(RoutePaths.quizResultScreen);
                        return ;
                      }
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeOut,
                      );
                    },
                  ))).values.toList(),
            ],
          );
        },
      ),
    );
  }
}
