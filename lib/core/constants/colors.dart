import 'package:flutter/material.dart';

class ProjectColors {
  BuildContext context;

  ProjectColors(this.context);

  Color imageBackground = const Color.fromARGB(255, 0, 0, 0);
  Color ratingBad = const Color.fromARGB(255, 225, 42, 28);
  Color ratingOk = const Color.fromARGB(255, 178, 108, 4);
  Color ratingGood = const Color.fromARGB(255, 21, 82, 237);
  Color ratingGreat = const Color.fromARGB(255, 22, 125, 25);
  Color status = const Color.fromARGB(255, 225, 99, 247);

  Color get link => const Color.fromARGB(255, 49, 231, 255);
  Color get imageFilter => Theme.of(context).colorScheme.onSecondary;
  Color get bottomBarBackground => Theme.of(context).colorScheme.onSecondary;
  Color get label => Theme.of(context).colorScheme.onSurface.withOpacity(0.5);
  Color get text => Theme.of(context).colorScheme.onSurface;
  Color get title => Theme.of(context).colorScheme.tertiary;
  Color get featured => Theme.of(context).colorScheme.primary;
  Color get line => Theme.of(context).colorScheme.outline.withOpacity(0.2);
}
