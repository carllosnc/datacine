import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

enum CreditType { cast, crew }

class MediaCreditsList extends StatefulWidget {
  final Map<String, List<PersonItem>>? credits;

  const MediaCreditsList({super.key, required this.credits});

  @override
  State<MediaCreditsList> createState() => _MediaCreditsListState();
}

class _MediaCreditsListState extends State<MediaCreditsList> {
  bool showSearch = false;
  String searchQuery = "";
  CreditType creditView = CreditType.cast;

  @override
  Widget build(BuildContext context) {
    List<PersonItem> cast = widget.credits!['cast']!.where(
      (person) {
        if (searchQuery.isEmpty) return true;

        return '${person.name}, ${person.character}'
            .toLowerCase()
            .contains(searchQuery);
      },
    ).toList();

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
      child: Scaffold(
        appBar: AppBar(
          title: showSearch
              ? TextField(
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
                      color: ProjectColors(context).text.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    border: const UnderlineInputBorder(),
                  ),
                )
              : const PageTitle(text: 'Credits'),
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
            dividerColor: ProjectColors(context).line,
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

                      return PersonListTile(person: person);
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

                      return PersonListTile(person: person);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
