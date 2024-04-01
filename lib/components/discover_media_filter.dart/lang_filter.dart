import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

class LangFilter extends StatefulWidget {
  final MediaType mediaType;
  final Function(String? value) onChanged;

  const LangFilter({
    super.key,
    required this.onChanged,
    required this.mediaType,
  });

  @override
  State<LangFilter> createState() => _LangFilterState();
}

class _LangFilterState extends State<LangFilter> {
  List<Language> filteredLangs = [];

  late Language selectedLang;

  FilterNotifier filterNotifier = FilterNotifier();

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

    dynamic currentFilterLang;

    // set current filter to current language
    if (widget.mediaType == MediaType.movie) {
      currentFilterLang = filterNotifier.movieFilters.value.lang;
    }

    // set current filter to current language
    if (widget.mediaType == MediaType.tv) {
      currentFilterLang = filterNotifier.tvShowFilters.value.lang;
    }

    // set selected language to current filter or first language in list
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
    return VWRow(
      verticalAlignment: CrossAxisAlignment.center,
      gap: 42,
      children: [
        Text(
          'Language:',
          style: TextStyle(color: AppColors.label),
        ),
        Expanded(
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
            onChanged: selectLanguage,
          ),
        ),
      ],
    );
  }

  void selectLanguage(Language? value) {
    setState(() {
      selectedLang = value!;
    });

    if (value?.iso6391 != null) {
      widget.onChanged(value!.iso6391!);
    } else {
      widget.onChanged(null);
    }
  }
}
