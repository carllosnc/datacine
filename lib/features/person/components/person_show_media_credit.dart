import 'package:flutter/material.dart';

import '/imports.dart';

showMediaCredit(
  BuildContext context,
  List<MediaItem>? list,
  MediaType mediaType,
  String title,
) {
  final items = List<MediaItem>.from(list ?? []);

  items.sort((a, b) {
    final aDate = (mediaType == MediaType.movie ? a.releaseDate : a.firstAirDate) ?? '';
    final bDate = (mediaType == MediaType.movie ? b.releaseDate : b.firstAirDate) ?? '';

    if (aDate.isEmpty && bDate.isEmpty) return 0;
    if (aDate.isEmpty) return 1;
    if (bDate.isEmpty) return -1;

    return bDate.compareTo(aDate);
  });

  return showModalBottomSheet(
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return PersonCreditsSheet(
        items: items,
        mediaType: mediaType,
        title: title,
      );
    },
  );
}

class PersonCreditsSheet extends StatefulWidget {
  final List<MediaItem> items;
  final MediaType mediaType;
  final String title;

  const PersonCreditsSheet({
    super.key,
    required this.items,
    required this.mediaType,
    required this.title,
  });

  @override
  State<PersonCreditsSheet> createState() => _PersonCreditsSheetState();
}

class _PersonCreditsSheetState extends State<PersonCreditsSheet> {
  bool showSearch = false;
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filtered = widget.items.where((item) {
      if (searchQuery.isEmpty) return true;
      final t = (item.title ?? item.name ?? '').toLowerCase();
      final c = (item.character ?? item.job ?? '').toLowerCase();
      return t.contains(searchQuery) || c.contains(searchQuery);
    }).toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.96 - 15,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: showSearch
              ? TextField(
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 0,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: AppColors.label.withValues(alpha: 0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    border: const UnderlineInputBorder(),
                  ),
                )
              : FloatPageTitle(
                  text: "${widget.title} (${filtered.length})",
                ),
          actions: [
            IconButton(
              icon: Icon(showSearch ? Icons.close : Icons.filter_list),
              onPressed: () {
                setState(() {
                  showSearch = !showSearch;
                  searchQuery = "";
                });
              },
            ),
          ],
        ),
        body: filtered.isEmpty
            ? const Empty()
            : ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  return ListTileCredit(
                    item: item,
                    mediaType: widget.mediaType,
                  );
                },
              ),
      ),
    );
  }
}
