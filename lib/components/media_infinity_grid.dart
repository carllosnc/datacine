import 'package:flutter/material.dart';
import 'package:giganoid_app/domain/domain.dart';
import '/core/core.dart';
import '/components/components.dart';

class MediaInfinityGrid extends StatefulWidget {
  final Function({required int page}) getData;
  final MediaType mediaType;
  final String pageTitle;

  const MediaInfinityGrid({
    super.key,
    required this.getData,
    required this.mediaType,
    required this.pageTitle,
  });

  @override
  State<MediaInfinityGrid> createState() => _MediaInfinityGridState();
}

class _MediaInfinityGridState extends State<MediaInfinityGrid> {
  final List<MediaItem> _dataList = [];
  bool _isLoading = false;
  int _page = 1;
  dynamic _totalPages = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  //clone fetch data when dispose
  @override
  void dispose() {
    super.dispose();
    fetchData().ignore();
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
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
              GridView.builder(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 80),
                itemCount: _dataList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.53,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 25,
                ),
                itemBuilder: (context, index) {
                  MediaItem mediaItem = _dataList[index];

                  if (index < _dataList.length) {
                    return MiniMediaCard(
                      mediaItem: mediaItem,
                      mediaType: widget.mediaType,
                    );
                  }
                  return null;
                },
              ),
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
