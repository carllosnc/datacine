import 'package:flutter/material.dart';
import '/imports/app.dart';

sealed class AppTextStyle {
  static TextStyle inputHint = TextStyle(
    color: AppColors.label.withOpacity(0.5),
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
