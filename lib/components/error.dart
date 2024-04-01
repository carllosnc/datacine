import 'package:flutter/material.dart';
import 'package:vw/vw_column.dart';
import '/imports.dart';

class ErrorBlock extends StatelessWidget {
  final String message;

  const ErrorBlock({super.key, this.message = 'Something went wrong.'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: VWColumn(
        horizontalAlignment: CrossAxisAlignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        gap: 5,
        children: [
          const Text(
            '💀',
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.label,
            ),
          ),
        ],
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
          color: AppColors.text,
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
