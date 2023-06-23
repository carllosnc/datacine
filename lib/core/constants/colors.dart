import 'package:flutter/material.dart';

class ProjectColors {
  BuildContext context;

  ProjectColors(this.context);

  Color imageFilter = const Color.fromARGB(255, 26, 5, 5);
  Color imageBackground = const Color.fromARGB(255, 0, 0, 0);
  Color ratingBad = const Color.fromARGB(255, 237, 61, 48);
  Color ratingOk = const Color.fromARGB(255, 178, 108, 4);
  Color ratingGood = const Color.fromARGB(255, 21, 82, 237);
  Color ratingGreat = const Color.fromARGB(255, 36, 147, 40);
  Color status = const Color.fromARGB(255, 225, 99, 247);
  Color link = const Color.fromARGB(255, 63, 220, 255);

  Color get bottomBarBackground => Theme.of(context).colorScheme.onSecondary;
  Color get label => Theme.of(context).colorScheme.onSurface.withOpacity(0.5);
  Color get text => Theme.of(context).colorScheme.onSurface;
  Color get title => Theme.of(context).colorScheme.tertiary;
  Color get featured => Theme.of(context).colorScheme.primary;
  Color get line => Theme.of(context).colorScheme.outline.withOpacity(0.2);
}
