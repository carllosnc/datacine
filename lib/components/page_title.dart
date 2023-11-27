import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const PageTitle({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return VWColumn(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        if (subtitle != null) const SizedBox(height: 3),
        if (subtitle != null)
          Text(
            subtitle ?? '-',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.label,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          )
      ],
    );
  }
}
