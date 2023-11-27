import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports/app.dart';

class SearchResult extends StatefulWidget {
  final String query;

  const SearchResult({
    super.key,
    required this.query,
  });

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  SearchType _currentSearchType = SearchType.movie;

  Future<MediaList> fetchMoviesData({required int page}) async {
    final searchRepository = SearchRepository(http.Client());

    var (mediaList, _) = await searchRepository.searchMovies(
      query: widget.query,
      page: page,
    );

    return mediaList;
  }

  Future<MediaList> fetchTvData({required int page}) async {
    final searchRepository = SearchRepository(http.Client());

    var (mediaList, _) = await searchRepository.searchTvShows(
      query: widget.query,
      page: page,
    );

    return mediaList;
  }

  Future<PersonList> fetchPeopleData({required int page}) async {
    final searchRepository = SearchRepository(http.Client());

    var (peopleList, _) = await searchRepository.searchPerson(
      query: widget.query,
      page: page,
    );

    return peopleList;
  }

  Future<CompanyList> fetchCompanyData({required int page}) async {
    final searchRepository = SearchRepository(http.Client());

    var (companyList, _) = await searchRepository.searchCompany(
      query: widget.query,
      page: page,
    );

    return companyList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_currentSearchType == SearchType.movie)
          Expanded(
            child: MediaInfinityGrid(
              key: const Key('movie_search_result'),
              mediaType: MediaType.movie,
              fetchData: fetchMoviesData,
            ),
          ),
        if (_currentSearchType == SearchType.tv)
          Expanded(
            child: MediaInfinityGrid(
              key: const Key('tv_search_result'),
              mediaType: MediaType.tv,
              fetchData: fetchTvData,
            ),
          ),
        if (_currentSearchType == SearchType.person)
          Expanded(
            child: PeopleInfinityList(
              key: const Key('people_search_result'),
              pageTitle: 'Search Result',
              fetchData: fetchPeopleData,
            ),
          ),
        if (_currentSearchType == SearchType.company)
          Expanded(
            child: CompanyInfinityGrid(
              key: const Key('company_search_result'),
              pageTitle: 'Search Result',
              fetchData: fetchCompanyData,
            ),
          ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.line,
                width: 1,
              ),
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              ChoiceChip(
                label: Text(
                  'Movie',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.label,
                  ),
                ),
                selected: _currentSearchType == SearchType.movie,
                onSelected: (value) {
                  setState(() {
                    _currentSearchType = SearchType.movie;
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  'TV Show',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.label,
                  ),
                ),
                selected: _currentSearchType == SearchType.tv,
                onSelected: (value) {
                  setState(() {
                    _currentSearchType = SearchType.tv;
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  'Person',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.label,
                  ),
                ),
                selected: _currentSearchType == SearchType.person,
                onSelected: (value) {
                  setState(() {
                    _currentSearchType = SearchType.person;
                  });
                },
              ),
              ChoiceChip(
                label: Text(
                  'Company',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.label,
                  ),
                ),
                selected: _currentSearchType == SearchType.company,
                onSelected: (value) {
                  setState(() {
                    _currentSearchType = SearchType.company;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
