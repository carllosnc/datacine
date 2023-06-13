import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  final bool condition;

  const SectionDivider({
    super.key,
    this.condition = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: condition,
      child: const Opacity(
        opacity: 0.4,
        child: Column(
          children: [
            SizedBox(height: 22),
            Divider(height: 1),
            SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
