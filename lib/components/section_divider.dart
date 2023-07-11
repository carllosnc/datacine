import 'package:flutter/material.dart';
import 'package:datacine/core/constants/colors.dart';

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
      child: Column(
        children: [
          const SizedBox(height: 25),
          Divider(
            height: 1,
            color: ProjectColors(context).line,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
