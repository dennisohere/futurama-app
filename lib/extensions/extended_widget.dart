
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

extension ExtendedWidget on Widget {

  Widget customCard() {
    return this.backgroundGradient(
      LinearGradient(
        colors: [Colors.white, Color(0xFFF4F4F4)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ).card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 1.3,
            color: Color(0xFFEDEDED),
          ),
        ),
        elevation: 0,
        borderOnForeground: true,
    );
  }

}