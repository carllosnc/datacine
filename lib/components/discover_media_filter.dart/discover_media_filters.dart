import 'package:flutter/material.dart';
import 'package:giganoid_app/core/constants/colors.dart';
import 'package:giganoid_app/core/constants/media_type.dart';
import '/components/components.dart';
import './year_filter.dart';
import './genre_filter.dart';
import './lang_filter.dart';

discoverMediaFilters({
  required BuildContext context,
  required String title,
  required MediaType mediaType,
}) {
  Map<String, String?> filters = {
    'year': null,
    'lang': null,
    'genre': null,
  };

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
                          onChanged: (dynamic value) {
                            filters['year'] = value;
                          },
                        ),
                        const SizedBox(height: 25),
                        LangFilter(
                          onChanged: (dynamic value) {
                            filters['lang'] = value;
                          },
                        ),
                        const SizedBox(height: 25),
                        GenreFilter(
                          onChanged: (dynamic value) {
                            filters['genre'] = value;
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
                  child: FilledButton.tonal(
                    onPressed: () {
                      debugPrint(filters.toString());
                      Navigator.pop(context);
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
