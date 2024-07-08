import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';
import 'movie_date_filter.dart';
import 'movie_genre_filter.dart';
import 'movie_lang_filter.dart';

class MovieFilters extends StatelessWidget {
  const MovieFilters({super.key});

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
          MovieDateFilter(),
          MovieGenreFilter(),
          MovieLangFilter(),
        ],
      ),
    );
  }
}
