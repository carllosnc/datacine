import 'package:flutter/material.dart';
import '/core/core.dart';

class Empty extends StatelessWidget {
  final String message;

  const Empty({super.key, this.message = 'Nothing here'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '👁',
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

class EmptyView extends StatelessWidget {
  final String title;

  const EmptyView({super.key, this.title = 'Nothing here'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: const Center(
        child: Empty(),
      ),
    );
  }
}
