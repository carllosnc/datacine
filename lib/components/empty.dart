import 'package:flutter/material.dart';
import '/core/core.dart';

class Empty extends StatelessWidget {
  final String message;

  const Empty({super.key, this.message = 'Nothing here'});

  //method to return random emojis
  String getRandomEmoji() {
    List<String> emojis = [
      '🐉',
      '🐲',
      '🦕',
      '🦖',
    ];

    int randomIndex = 0 + (DateTime.now().millisecond % emojis.length);

    return emojis[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            getRandomEmoji(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 80,
              color: ProjectColors(context).text,
            ),
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: ProjectColors(context).text,
            ),
          ),
        ],
      ),
    );
  }
}
