import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';
import 'date_filter.dart';
import 'genre_filter.dart';
import 'lang_filter.dart';

class TvShowFilters extends StatelessWidget {
  const TvShowFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return VWBox(
      height: 60,
      blurEffect: 5,
      border: Border(
        top: BorderSide(
          color: AppColors.line,
          width: 1,
        ),
      ),
      color: AppColors.backgroundColor(context),
      child: const VWRow(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        scrollable: true,
        gap: 10,
        verticalAlignment: CrossAxisAlignment.center,
        horizontalAlignment: MainAxisAlignment.center,
        children: [
          DateFilter(),
          GenreFilter(),
          LangFilter(),
        ],
      ),
    );
  }
}
