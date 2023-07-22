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
  Color get imageFilter => Theme.of(context).colorScheme.secondary;
  Color get profileFilter => Theme.of(context).colorScheme.background;
  Color get logoFilter => Theme.of(context).colorScheme.primary;
  Color get textError => Theme.of(context).colorScheme.error;
  Color get bottomBarBackground =>
      Theme.of(context).colorScheme.primaryContainer;
  Color get label => Theme.of(context).colorScheme.onSurface.withOpacity(0.6);
  Color get text => Theme.of(context).colorScheme.onSurface;
  Color get title => Theme.of(context).colorScheme.tertiary;
  Color get featured => Theme.of(context).colorScheme.primary;
  Color get line => Theme.of(context).colorScheme.outline.withOpacity(0.2);

  Color linkButton() {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Theme.of(context).colorScheme.secondary.withOpacity(0.05);
    }

    return Theme.of(context).colorScheme.primary.withOpacity(0.1);
  }

  Color randomColor() {
    var colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
      Colors.orange,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
      Colors.indigo,
      Colors.lime,
      Colors.amber,
      Colors.brown,
      Colors.grey,
    ];

    return colors[DateTime.now().millisecondsSinceEpoch % colors.length];
  }
}
