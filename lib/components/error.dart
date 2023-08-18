import 'package:flutter/material.dart';
import '/imports/app.dart';

class ErrorBlock extends StatelessWidget {
  final String message;

  const ErrorBlock({super.key, this.message = 'Something went wrong.'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '💀',
              style: TextStyle(
                fontSize: 70,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              message,
              style: TextStyle(
                fontSize: 14,
                color: ProjectColors(context).text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  final String message;

  const ErrorText({super.key, this.message = 'Something went wrong.'});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.red[800],
      ),
      width: double.infinity,
      child: Text(
        message,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: ProjectColors(context).text,
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ErrorBlock(),
    );
  }
}
