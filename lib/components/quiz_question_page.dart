import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:futurama/data/quiz/quiz.dart';
import 'package:futurama/services/quiz_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class QuizQuestionPage extends ConsumerStatefulWidget {
  final Function onPageSubmitted;
  final Quiz quiz;
  final num currentPage;
  final num totalPages;

  const QuizQuestionPage({
    Key? key,
    required this.quiz,
    required this.onPageSubmitted,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  ConsumerState<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends ConsumerState<QuizQuestionPage> {
  String selectedAnswer = "";

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        <Widget>[
          Icon(
            Icons.check_circle,
            color: Colors.green.shade600,
          ),
          const SizedBox(
            width: 3,
          ),
          Text('${ref.read(correctAnswersProvider).length}')
              .fontSize(24)
              .bold()
              .textColor(Colors.green),
        ].toRow(),
        <Widget>[
          Text('Q.${widget.currentPage} of ${widget.totalPages}').bold(),
        ].toRow(),
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
      const SizedBox(
        height: 40,
      ),
      <Widget>[
        Text(widget.quiz.question)
            .textAlignment(TextAlign.center)
            .fontSize(25)
            .bold()
            .expanded(),
      ].toRow(mainAxisAlignment: MainAxisAlignment.center),
      const SizedBox(
        height: 20,
      ),
      ...widget.quiz.possibleAnswers
          .map((option) => Text(option)
                  .textColor(
                      selectedAnswer == option ? Colors.white : Colors.black)
                  .textAlignment(TextAlign.center)
                  .fontSize(19)
                  .padding(horizontal: 18, vertical: 16)
                  .backgroundColor(
                      selectedAnswer == option ? Colors.blue : Colors.black12)
                  .ripple()
                  .clipRRect(all: 23)
                  .gestures(onTap: () {
                setState(() {
                  selectedAnswer = option;
                });
              }).padding(vertical: 7))
          .toList(),
      const SizedBox(
        height: 40,
      ),
      TextButton.icon(
          icon: const Icon(Icons.check_circle),
          onPressed: selectedAnswer.isNotEmpty
              ? () {
                  if (selectedAnswer == widget.quiz.correctAnswer.toString()) {
                    ref
                        .read(correctAnswersProvider.notifier)
                        .state
                        .add(widget.quiz);
                    EasyLoading.showSuccess('Correct',
                        duration: const Duration(milliseconds: 250));
                  } else {
                    ref.read(incorrectAnswersProvider.notifier)
                        .state
                        .add(widget.quiz);
                    EasyLoading.showError('Wrong',
                        duration: const Duration(milliseconds: 250));
                  }

                  widget.onPageSubmitted.call();

          }
              : null,
          label: Text(widget.currentPage == widget.totalPages ? 'Finish' : 'Next')
              .fontSize(18)),

    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
        )
        .padding(horizontal: 20, vertical: 25)
        .scrollable();
  }
}
