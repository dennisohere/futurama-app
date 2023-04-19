import 'package:flutter/material.dart';
import 'package:futurama/utils/route_paths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:styled_widget/styled_widget.dart';

import '../services/navigation_service.dart';

final Map<String, SalomonBottomBarItem> _menu = {
  RoutePaths.homeScreen: SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.blue,
          ),

  RoutePaths.characterScreen: SalomonBottomBarItem(
            icon: const Icon(Icons.people_alt),
            title: const Text("Characters"),
            selectedColor: Colors.deepPurple,
          ),

  RoutePaths.quizScreen: SalomonBottomBarItem(
            icon: const Icon(Icons.quiz),
            title: const Text("Quiz"),
            selectedColor: Colors.blueGrey,
          ),

};

class BottomNav extends StatefulHookConsumerWidget {
  final bool show;

  const BottomNav({
    Key? key,
    this.show = true,
  }) : super(key: key);

  @override
  ConsumerState<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends ConsumerState<BottomNav> {

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    final currentRouteName = NavigationService().currentRouteName;

    if(currentRouteName == '/'){
      _currentIndex = 0;
      return ;
    }

    _currentIndex = _menu.keys.toList().indexOf(currentRouteName!);
  }

  @override
  Widget build(BuildContext context) {

    if (!widget.show) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }

    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) {
        if(_currentIndex == i) return ;

        setState(() => _currentIndex = i);
        final route = _menu.keys.toList().elementAt(i);
        NavigationService().navigateTo(route);
      },
      items: _menu.values.toList(),
    ).padding(horizontal: 25);

  }
}
