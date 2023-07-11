import 'package:flutter/material.dart';
import 'package:datacine/domain/domain.dart';
import '/components/components.dart';

class PeopleInfinityGrid extends StatefulWidget {
  final Function({required int page}) fetchData;
  final String pageTitle;

  const PeopleInfinityGrid({
    super.key,
    required this.fetchData,
    required this.pageTitle,
  });

  @override
  State<PeopleInfinityGrid> createState() => _PeopleInfinityGridState();
}

class _PeopleInfinityGridState extends State<PeopleInfinityGrid> {
  final List<PersonItem> _dataList = [];
  bool _isLoading = false;
  int _page = 1;
  dynamic _totalPages = false;
  dynamic _error = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // fetch data from api and add to _dataList and increase _page by 1
  Future<void> fetchData() async {
    try {
      final newData = await widget.fetchData(page: _page);

      setState(() {
        _dataList.addAll(newData.results!);
        _isLoading = false;
        _totalPages = newData.totalPages;
        _page++;
      });
    } catch (e) {
      setState(() {
        _error = e;
      });
    }
  }

  // check if scroll reached the end of the page
  bool _onScrollNotification(ScrollNotification notification) {
    if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
      if (!_isLoading && _page <= _totalPages) {
        setState(() {
          _isLoading = true;
        });
        fetchData();
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    if (_error != false) {
      return const ErrorBlock();
    }

    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: Stack(
            children: [
              //if _dataList is empty and _totalPages is 0 show empty
              if (_dataList.isEmpty && (_totalPages == 1 || _totalPages == 0))
                const Positioned(
                  child: Empty(),
                ),

              //if _dataList is empty and _totalPages is not 0 or 1 show loading
              if (_dataList.isEmpty && (_totalPages != 0 && _totalPages != 1))
                const Positioned(
                  child: Loading(),
                ),
              GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 80),
                itemCount: _dataList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.54,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 25,
                ),
                itemBuilder: (context, index) {
                  PersonItem personItem = _dataList[index];

                  if (index < _dataList.length) {
                    return PersonCard(personItem: personItem);
                  }

                  return null;
                },
              )
            ],
          ),
        ),
        if (_isLoading)
          const Positioned(
            child: LinearProgressIndicator(
              minHeight: 3,
            ),
          ),
      ],
    );
  }
}
