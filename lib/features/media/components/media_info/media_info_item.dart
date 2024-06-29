import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

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
          Label(text: label),
          MediumText(text: item),
        ],
      ),
    );
  }
}
