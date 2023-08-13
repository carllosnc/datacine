import 'package:datacine/imports/components.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import 'company_tab.dart';
import '/core/core.dart';

class CompanyView extends StatefulWidget {
  final Company company;

  const CompanyView({super.key, required this.company});

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: PageTitle(title: widget.company.name!),
      ),
      body: [
        CompanyMovieTabs(
          key: const PageStorageKey('company_movies'),
          company: widget.company,
          mediaType: MediaType.movie,
        ),
        CompanyMovieTabs(
          key: const PageStorageKey('company_tv_shows'),
          company: widget.company,
          mediaType: MediaType.tv,
        ),
      ][_selectedPageIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.movie),
            icon: Icon(Icons.movie_outlined),
            label: 'Movies',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.tv),
            icon: Icon(Icons.tv_outlined),
            label: 'TV Series',
          )
        ],
      ),
    );
  }
}
