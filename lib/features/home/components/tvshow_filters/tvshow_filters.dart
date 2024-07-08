import 'package:vw/vw.dart';
import 'package:flutter/material.dart';
import '/imports.dart';
import 'tvshow_date_filter.dart';
import 'tvshow_genre_filter.dart';
import 'tvshow_lang_filter.dart';

class TvShowFilters extends StatelessWidget {
  const TvShowFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return VWBox(
      height: 80,
      blurEffect: 5,
      border: Border(
        top: BorderSide(
          color: AppColors.line,
          width: 1,
        ),
      ),
      color: AppColors.backgroundColor(context),
      child: const VWRow(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        scrollable: true,
        gap: 10,
        verticalAlignment: CrossAxisAlignment.center,
        horizontalAlignment: MainAxisAlignment.center,
        children: [
          TvShowDateFilter(),
          TvShowGenreFilter(),
          TvShowLangFilter(),
        ],
      ),
    );
  }
}
