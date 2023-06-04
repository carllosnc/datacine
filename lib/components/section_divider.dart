import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionDivider({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
              Icon(icon, color: Colors.white, size: 20),
              DS1Text(title, fontSize: 15),
            ],
          ),
        ),
      ),
    );
  }
}
