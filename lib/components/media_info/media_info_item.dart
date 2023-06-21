import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/core/core.dart';

class MediaInfoItem extends StatelessWidget {
  final bool condition;
  final String label;
  final String item;

  const MediaInfoItem({
    super.key,
    required this.item,
    required this.label,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: condition,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DS1Text(
              label,
              fontSize: 14,
              fontColor: ProjectColors(context).label,
            ),
            const SizedBox(height: 3),
            DS1Text(
              item,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}
