import 'package:flutter/material.dart';
import '/core/core.dart';
import '/domain/domain.dart';
import '/notifiers/notifiers.dart';

class LangFilter extends StatefulWidget {
  final Function(String? value) onChanged;
  const LangFilter({
    super.key,
    required this.onChanged,
  });

  @override
  State<LangFilter> createState() => _LangFilterState();
}

class _LangFilterState extends State<LangFilter> {
  List<Language> filteredLangs = [];

  late Language selectedLang;

  MovieFilterNotifier movieFilterNotifier = MovieFilterNotifier();

  @override
  void initState() {
    super.initState();

    // Add all languages to the list
    filteredLangs.add(
      Language(
        iso6391: null,
        englishName: 'All',
        name: 'All',
      ),
    );

    // Add only the languages we want to the list
    filteredLangs.addAll(
      languages.where((lang) {
        return lang.iso6391 == 'en' ||
            lang.iso6391 == 'fr' ||
            lang.iso6391 == 'es' ||
            lang.iso6391 == 'ja' ||
            lang.iso6391 == 'ru' ||
            lang.iso6391 == 'ko' ||
            lang.iso6391 == 'cn' ||
            lang.iso6391 == 'de' ||
            lang.iso6391 == 'it';
      }).toList(),
    );

    // Get current filter from notifier
    var currentFilterLang = movieFilterNotifier.filters.value['lang'];

    // Set selected language to current filter or first language in list
    if (currentFilterLang != null) {
      selectedLang = filteredLangs.firstWhere(
        (lang) => lang.iso6391 == currentFilterLang,
      );
    } else {
      selectedLang = filteredLangs.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Language: '),
        SizedBox(
          width: 220,
          child: DropdownButtonFormField(
            value: selectedLang,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.expand_more),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.translate),
            ),
            items: filteredLangs.map((Language lang) {
              return DropdownMenuItem(
                value: lang,
                child: Text(
                  lang.englishName!,
                ),
              );
            }).toList(),
            onChanged: (Language? value) {
              setState(() {
                selectedLang = value!;
              });

              if (value?.iso6391 != null) {
                widget.onChanged(value!.iso6391!);
              } else {
                widget.onChanged(null);
              }
            },
          ),
        ),
      ],
    );
  }
}
