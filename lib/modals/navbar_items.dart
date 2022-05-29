import 'package:flutter/material.dart';

class Screens {
  const Screens(this.label, this.icon, this.color);
  final String label;
  final IconData icon;
  final MaterialColor color;
}

const List<Screens> allScreens = <Screens>[
  Screens('Home', Icons.home, Colors.pink),
  Screens('Community', Icons.question_answer_outlined, Colors.orange),
  Screens('You', Icons.person_outline, Colors.yellow),
];
