import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _singleton = NavigationService._internal();

  factory NavigationService() {
    return _singleton;
  }

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  String? currentRouteName = '';

  Future<dynamic> navigateTo(String routeName,
      {Object? arguments, bool replace = false}) {
    if (replace) {
      return navigatorKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    }

    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  pop() {
    navigatorKey.currentState!.pop();
  }
}
