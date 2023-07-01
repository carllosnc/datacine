import 'package:flutter/material.dart';
import '/core/core.dart';
import '/domain/domain.dart';

class LangFilter extends StatefulWidget {
  final Function(dynamic) onChanged;

  const LangFilter({super.key, required this.onChanged});

  @override
  State<LangFilter> createState() => _LangFilterState();
}

class _LangFilterState extends State<LangFilter> {
  List<Language> filteredLangs = [];
  late Language selectedLang;

  @override
  void initState() {
    super.initState();

    filteredLangs.add(
      Language(
        iso6391: null,
        englishName: 'All',
        name: 'All',
      ),
    );

    filteredLangs.addAll(languages.where((lang) {
      return lang.iso6391 == 'en' ||
          lang.iso6391 == 'fr' ||
          lang.iso6391 == 'es' ||
          lang.iso6391 == 'ja' ||
          lang.iso6391 == 'ru' ||
          lang.iso6391 == 'ko';
    }).toList());

    selectedLang = filteredLangs.first;
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

              widget.onChanged(value!.iso6391);
            },
          ),
        ),
      ],
    );
  }
}
