import 'package:flutter/material.dart';
import 'package:datacine/core/constants/colors.dart';
import 'package:datacine/core/constants/media_type.dart';
import '/components/components.dart';
import '/notifiers/notifiers.dart';
import './year_filter.dart';
import './genre_filter.dart';
import './lang_filter.dart';

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

  showDialog(
    context: context,
    builder: (context) {
      return Dialog.fullscreen(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            child: Column(
              children: [
                ModalHeader(
                  title: title,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        YearsFilter(
                          mediaType: mediaType,
                          onChanged: (dynamic value) {
                            filter.years = value;
                          },
                        ),
                        const SizedBox(height: 25),
                        LangFilter(
                          mediaType: mediaType,
                          onChanged: (dynamic value) {
                            filter.lang = value;
                          },
                        ),
                        const SizedBox(height: 25),
                        GenreFilter(
                          onChanged: (dynamic value) {
                            filter.genres = value;
                          },
                          mediaType: mediaType,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: ProjectColors(context).line,
                        width: 1,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pop(context);

                      if (mediaType == MediaType.movie) {
                        filterNotifier.movieFilters.value = filter;
                      }

                      if (mediaType == MediaType.tv) {
                        filterNotifier.tvShowFilters.value = filter;
                      }
                    },
                    child: const Text(
                      'Apply Filters',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
