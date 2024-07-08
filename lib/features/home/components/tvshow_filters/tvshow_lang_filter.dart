import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

class TvShowLangFilter extends StatefulWidget {
  const TvShowLangFilter({super.key});

  @override
  State<TvShowLangFilter> createState() => _TvShowLangFilterState();
}

class _TvShowLangFilterState extends State<TvShowLangFilter> with SharedState {
  List<Language> getLang() {
    return languages.where((element) {
      return [
        "English",
        "Spanish",
        "French",
        "German",
        "Italian",
        "Japanese",
        "Portuguese",
        "Russian",
        "Chinese",
        "Korean",
        "Arabic",
      ].contains(element.englishName);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var currentLang = tvShowFilterState.lang?.englishName;

    return VWButton(
      label: currentLang ?? 'All languages',
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Language filter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      tvShowFilterState.setLang(null);
                    },
                    icon: const Icon(Icons.refresh),
                  )
                ],
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              body: VWBox(
                height: 1000,
                child: ListView.builder(
                  itemCount: getLang().length,
                  itemBuilder: (context, index) {
                    Language lang = getLang()[index];

                    return ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        tvShowFilterState.setLang(lang);
                      },
                      leading: Icon(
                        Icons.translate,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      title: Text("${lang.englishName}"),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
