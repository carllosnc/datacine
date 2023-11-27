import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
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
      child: VWColumn(
        gap: 3,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.label,
            ),
          ),
          Text(
            item,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
