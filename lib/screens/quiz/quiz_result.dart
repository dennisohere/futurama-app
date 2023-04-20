import 'package:flutter/material.dart';
import 'package:futurama/data/quiz/quiz.dart';
import 'package:futurama/screens/layout/app_layout.dart';
import 'package:futurama/services/navigation_service.dart';
import 'package:futurama/utils/route_paths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../services/quiz_service.dart';

class QuizResultScreen extends ConsumerStatefulWidget {
  const QuizResultScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends ConsumerState<QuizResultScreen> {
  @override
  Widget build(BuildContext context) {
    final correctQuestions = ref.read(correctAnswersProvider);
    final List<Quiz> incorrectQuestions = ref.read(incorrectAnswersProvider);

    return AppLayout(
      body: <Widget>[
        const Text('Quiz Result').fontSize(22)
            .textColor(Colors.grey.shade700)
            .bold().padding(vertical: 35).center(),

        <Widget>[
          Text(correctQuestions.length.toString()).bold().fontSize(55).textColor(Colors.green.shade600),
          const SizedBox(width: 11,),
          const Text('out of').fontSize(22).bold(),
          const SizedBox(width: 11,),
          Text('${incorrectQuestions.length + correctQuestions.length}')
              .textColor(Colors.black54).bold().fontSize(55),
        ].toRow(mainAxisAlignment: MainAxisAlignment.center)
        .padding(bottom: 35),

        const Text('Corrections').fontSize(18)
            .textColor(Colors.black)
            .bold().padding(horizontal: 14),

        ...incorrectQuestions.map((question) => ListTile(
          title: Text(question.question),
          subtitle: Text(question.correctAnswer.toString()),
        )),

        <Widget>[
          ElevatedButton(onPressed: (){
            NavigationService().navigateTo(RoutePaths.quizScreen);
          }, child: const Text('Close / Retake Quiz')),
        ].toRow(mainAxisAlignment: MainAxisAlignment.center),

      ].toColumn(crossAxisAlignment: CrossAxisAlignment.stretch)
          .padding(horizontal: 20, bottom: 23).scrollable(),
    );
  }
}
