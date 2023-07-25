import 'package:flutter/material.dart';
import '/core/core.dart';

class PageSubtitle extends StatelessWidget {
  final String text;

  const PageSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        color: ProjectColors(context).label,
        fontSize: 12,
      ),
      textAlign: TextAlign.center,
    );
  }
}
