import 'package:flutter/material.dart';
import '/imports/app.dart';

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
          vertical: 10,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: ProjectColors(context).label,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              item,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
