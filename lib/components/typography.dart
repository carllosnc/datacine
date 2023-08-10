import 'package:flutter/material.dart';
import '/core/core.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 12,
        letterSpacing: 1.8,
        fontWeight: FontWeight.w700,
        color: ProjectColors(context).title,
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String text;
  const Label({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: ProjectColors(context).label,
      ),
    );
  }
}

class BigTitle extends StatelessWidget {
  final String text;

  const BigTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: ProjectColors(context).title,
      ),
    );
  }
}
