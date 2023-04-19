import 'package:flutter/material.dart';
import 'package:futurama/data/character/character.dart';
import 'package:futurama/screens/character/characters.dart';
import 'package:futurama/screens/character/characters_detail.dart';
import 'package:futurama/screens/home.dart';
import 'package:futurama/utils/route_paths.dart';

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

        default:
          return const HomeScreen();
      }
    },
  );
}
