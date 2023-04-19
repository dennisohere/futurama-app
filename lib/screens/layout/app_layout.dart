import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/material.dart';
import '../../components/bottom_nav.dart';


class AppLayout extends StatefulHookConsumerWidget {
  final Widget body;
  final bool useBackButton;
  final bool hasHeader;
  final bool hasBottomNav;
  final bool hasFab;
  final String? title;

  const AppLayout({
    Key? key,
    required this.body,
    this.useBackButton = false,
    this.hasHeader = true,
    this.hasBottomNav = true,
    this.hasFab = true,
    this.title,
  }) : super(key: key);

  @override
  ConsumerState<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends ConsumerState<AppLayout> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: widget.body,
      ),
      bottomNavigationBar: widget.hasBottomNav ? const BottomNav() : const SizedBox(height: 0),
      drawerScrimColor: const Color(0xFF555050).withOpacity(0.96),
    ).gestures(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }

}

