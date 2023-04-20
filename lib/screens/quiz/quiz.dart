import 'package:flutter/material.dart';
import 'package:futurama/screens/layout/app_layout.dart';
import 'package:futurama/services/navigation_service.dart';
import 'package:futurama/utils/route_paths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      body: <Widget>[
        <Widget>[
          ElevatedButton(
            onPressed: () {
              NavigationService().navigateTo(RoutePaths.takeQuizScreen);
            },
            child: const Text('Start Quiz').fontSize(23).padding(all: 14),
          ),
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.center
        ),
      ].toColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch
      ),
    );
  }
}
