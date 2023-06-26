import 'package:flutter/material.dart';
import 'package:giganoid_app/domain/domain.dart';
import '/components/components.dart';

class CompanyInfinityGrid extends StatefulWidget {
  final Function({required int page}) getData;
  final String pageTitle;

  const CompanyInfinityGrid({
    super.key,
    required this.getData,
    required this.pageTitle,
  });

  @override
  State<CompanyInfinityGrid> createState() => _CompanyInfinityGridState();
}

class _CompanyInfinityGridState extends State<CompanyInfinityGrid> {
  final List<Company> _dataList = [];
  bool _isLoading = false;
  int _page = 1;
  dynamic _totalPages = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final newData = await widget.getData(page: _page);

    setState(() {
      _dataList.addAll(newData.results!);
      _isLoading = false;
      _totalPages = newData.totalPages;
      _page++;
    });
  }

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
    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: _onScrollNotification,
          child: Stack(
            children: [
              if (_dataList.isEmpty && (_totalPages == 1 || _totalPages == 0))
                const Positioned(
                  child: Empty(),
                ),
              if (_dataList.isEmpty && (_totalPages != 0 && _totalPages != 1))
                const Positioned(
                  child: Loading(),
                ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _dataList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  Company company = _dataList[index];

                  if (index < _dataList.length) {
                    return CompanyListTile(company: company);
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
