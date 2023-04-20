import 'package:flutter/material.dart';
import 'package:futurama/data/character/character.dart';
import 'package:futurama/screens/character/characters.dart';
import 'package:futurama/screens/character/characters_detail.dart';
import 'package:futurama/screens/home.dart';
import 'package:futurama/screens/quiz/quiz_result.dart';
import 'package:futurama/screens/quiz/take_quiz.dart';
import 'package:futurama/utils/route_paths.dart';

import 'screens/quiz/quiz.dart';
import 'services/navigation_service.dart';


Route routes(RouteSettings settings) {
  NavigationService().currentRouteName = settings.name;

  return MaterialPageRoute(
    builder: (context) {
      switch (settings.name) {
        case RoutePaths.homeScreen:
          return const HomeScreen();

        case RoutePaths.characterScreen:
          return const CharacterScreen();

        case RoutePaths.characterDetailScreen:
          final character = settings.arguments as Character;
          return CharacterDetailScreen(character: character);

        case RoutePaths.quizScreen:
          return const QuizScreen();

        case RoutePaths.takeQuizScreen:
          return const TakeQuizScreen();

        case RoutePaths.quizResultScreen:
          return const QuizResultScreen();
        default:
          return const HomeScreen();
      }
    },
  );
}
