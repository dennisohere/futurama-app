import 'package:flutter/material.dart';
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

        default:
          return const HomeScreen();
      }
    },
  );
}
