import 'package:flutter/material.dart';
import '/imports.dart';

enum CreditType { cast, crew }

showListMediaCredits({
  required BuildContext context,
  required Map<String, List<PersonItem>> credits,
  required String title,
}) {
  showModalBottomSheet(
    useSafeArea: true,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return MediaCreditsList(
        credits: credits,
        title: title,
      );
    },
  );
}

class MediaCreditsList extends StatefulWidget {
  final Map<String, List<PersonItem>>? credits;
  final String title;

  const MediaCreditsList({
    super.key,
    required this.credits,
    required this.title,
  });

  @override
  State<MediaCreditsList> createState() => _MediaCreditsListState();
}

class _MediaCreditsListState extends State<MediaCreditsList> {
  bool showSearch = false;
  String searchQuery = "";
  CreditType creditView = CreditType.cast;

  TextField filter(BuildContext context) {
    return TextField(
      autofocus: true,
      onChanged: (value) {
        String query = value.toLowerCase();
        setState(() {
          searchQuery = query;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 0,
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: AppColors.label.withOpacity(0.5),
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        border: const UnderlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // filter cast
    List<PersonItem> cast = widget.credits!['cast']!.where(
      (person) {
        if (searchQuery.isEmpty) return true;

        return '${person.name}, ${person.character}'
            .toLowerCase()
            .contains(searchQuery);
      },
    ).toList();

    // filter crew
    List<PersonItem> crew = widget.credits!['crew']!.where(
      (person) {
        if (searchQuery.isEmpty) return true;

        return '${person.name}, ${person.job}'
            .toLowerCase()
            .contains(searchQuery);
      },
    ).toList();

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
            title: showSearch
                ? filter(context)
                : const FloatPageTitle(text: "Credits"),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    showSearch = !showSearch;
                    searchQuery = "";
                  });
                },
                icon: const Icon(Icons.filter_list),
              ),
            ],
            bottom: TabBar(
              dividerColor: AppColors.line,
              tabs: [
                Tab(text: 'Cast (${cast.length})'),
                Tab(text: 'Crew (${crew.length})'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              cast.isEmpty
                  ? const Empty()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: cast.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        PersonItem person = cast[index];

                        return ListTilePerson(person: person);
                      },
                    ),
              crew.isEmpty
                  ? const Empty()
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: crew.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        PersonItem person = crew[index];

                        return ListTilePerson(person: person);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
