import 'package:ds1/components/text/text.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

enum CreditType { cast, crew }

class _Item extends StatelessWidget {
  final PersonItem person;

  const _Item({required this.person});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: DS1Text(person.name!, fontSize: 15),
      leading: SizedBox(
        width: 45,
        height: 45 * 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              ProjectColors(context).imageFilter,
              BlendMode.color,
            ),
            child: ImageComponent(
              imageSize: ImageSize.profileW185,
              imagePath: person.profilePath,
              imageType: ImageType.profile,
            ),
          ),
        ),
      ),
      subtitle: DS1Text(
        person.character ?? person.job!,
        fontSize: 12,
        fontColor: ProjectColors(context).featured,
      ),
    );
  }
}

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
              : const DS1Text('Credits', fontSize: 14),
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

                      return _Item(person: person);
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

                      return _Item(person: person);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
