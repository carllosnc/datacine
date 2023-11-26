import 'package:flutter/material.dart';

class ProjectColors {
  BuildContext context;

  ProjectColors(this.context);

  Color ratingBad = const Color.fromARGB(255, 225, 42, 28);
  Color ratingOk = const Color.fromARGB(255, 178, 108, 4);
  Color ratingGood = const Color.fromARGB(255, 21, 82, 237);
  Color ratingGreat = const Color.fromARGB(255, 22, 125, 25);
  Color status = const Color.fromARGB(255, 225, 99, 247);

  Color get imageBackground => Colors.black;
  Color get imageFilter => Theme.of(context).colorScheme.background;
  Color get imageFilterFallback => Theme.of(context).colorScheme.surfaceVariant;
  Color get profileFilter => Theme.of(context).colorScheme.background;
  Color get textError => Theme.of(context).colorScheme.error;
  Color get bottomBarBackground => Theme.of(context).colorScheme.primaryContainer;
  Color get label => Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
  Color get text => Theme.of(context).colorScheme.onSurface;
  Color get title => Colors.white;
  Color get featured => Theme.of(context).colorScheme.primary;
  Color get line => Colors.white.withOpacity(0.1);
  Color get linkButton => Colors.white.withOpacity(0.07);
  Color get modalBackground => Theme.of(context).colorScheme.background;
  Color get imagePlaceholder => Colors.black;
}
