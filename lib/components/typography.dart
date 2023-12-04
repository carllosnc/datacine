import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 12,
        letterSpacing: 1.8,
        fontWeight: FontWeight.w700,
        color: AppColors.title,
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String text;
  const Label({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: AppColors.label,
      ),
    );
  }
}

class BigTitle extends StatelessWidget {
  final String text;

  const BigTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        height: 1.2,
        fontWeight: FontWeight.w300,
        color: AppColors.title,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  const SmallText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: AppColors.text,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  final String text;
  const MediumText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: AppColors.text,
      ),
    );
  }
}

class FloatPageTitle extends StatelessWidget {
  final String text;
  const FloatPageTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 12,
        letterSpacing: 1.8,
        fontWeight: FontWeight.w700,
        color: AppColors.title,
      ),
    );
  }
}

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
