import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports.dart';

class PeopleTab extends StatefulWidget {
  const PeopleTab({super.key});

  @override
  State<PeopleTab> createState() => _PeopleTabState();
}

class _PeopleTabState extends State<PeopleTab>
    with AutomaticKeepAliveClientMixin<PeopleTab> {
  Future<PersonList> fetchPeople({required int page}) async {
    final trendingRepository = TrendingRepository(http.Client());

    var (personList, _) = await trendingRepository.getCelebs(
      page: page,
    );

    return personList;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GridPeopleInfinity(
      pageTitle: 'People',
      fetchData: fetchPeople,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
