import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import './year_filter.dart';
import './genre_filter.dart';
import './lang_filter.dart';
import '/imports/app.dart';

discoverMediaFilters({
  required BuildContext context,
  required String title,
  required MediaType mediaType,
}) {
  FilterNotifier filterNotifier = FilterNotifier();
  late Filter filter;

  if (mediaType == MediaType.movie) {
    filter = filterNotifier.movieFilters.value.copyWith();
  }

  if (mediaType == MediaType.tv) {
    filter = filterNotifier.tvShowFilters.value.copyWith();
  }

  applyAction() {
    Navigator.pop(context);

    if (mediaType == MediaType.movie) {
      filterNotifier.movieFilters.value = filter;
    }

    if (mediaType == MediaType.tv) {
      filterNotifier.tvShowFilters.value = filter;
    }
  }

  VWPage.open(
    context: context,
    appBar: AppBar(
      title: SectionTitle(text: title),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close),
      ),
    ),
    body: SingleChildScrollView(
      child: VWColumn(
        gap: 30,
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        children: [
          YearsFilter(
            mediaType: mediaType,
            onChanged: (dynamic value) {
              filter.years = value;
            },
          ),
          LangFilter(
            mediaType: mediaType,
            onChanged: (dynamic value) {
              filter.lang = value;
            },
          ),
          GenreFilter(
            onChanged: (dynamic value) {
              filter.genres = value;
            },
            mediaType: mediaType,
          ),
        ],
      ),
    ),
    bottomBar: Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: VWButton(
        label: 'Apply',
        color: AppColors.buttonColor,
        onTap: () {
          applyAction();
        },
      ),
    ),
  );
}
