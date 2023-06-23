import 'package:ds1/components/text/text.dart';
import 'package:flutter/material.dart';
import 'package:giganoid_app/domain/domain.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import '/data/data.dart';
import '/core/core.dart';
import '/components/components.dart';

class MediaSimilarInfinityGrid extends StatefulWidget {
  final int id;
  final MediaType mediaType;

  const MediaSimilarInfinityGrid({
    super.key,
    required this.id,
    required this.mediaType,
  });

  @override
  State<MediaSimilarInfinityGrid> createState() =>
      _MediaSimilarInfinityGridState();
}

class _MediaSimilarInfinityGridState extends State<MediaSimilarInfinityGrid> {
  final List<MediaItem> _dataList = [];
  bool _isLoading = false;
  int _page = 1;
  dynamic _totalPages = false;

  final _mediaSimilarRepository = MediaSimilarRepository(http.Client());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final newData = await _mediaSimilarRepository.similar(
      mediaId: widget.id,
      mediaType: widget.mediaType,
      page: _page,
    );

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
    return Scaffold(
      appBar: AppBar(
        title: DS1Text(
          _isLoading ? '⏳ Loading...' : 'Similar',
          fontSize: 14,
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _onScrollNotification,
        child: Stack(
          children: [
            if (_dataList.isEmpty && _totalPages == 0)
              const Positioned.fill(
                child: Empty(),
              ),
            if (_dataList.isEmpty && _totalPages != 0)
              const Positioned.fill(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            GridView.builder(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
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
                  return GestureDetector(
                    onTap: () {
                      context.go(
                        '/${widget.mediaType.value}/${mediaItem.id.toString()}',
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ImageComponent(
                                imageSize: ImageSize.posterW154,
                                imagePath: mediaItem.posterPath,
                                imageType: ImageType.poster,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (mediaItem.releaseDate ??
                                        mediaItem.firstAirDate!)
                                    .formatDateTime(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ProjectColors(context).featured,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                mediaItem.title ?? mediaItem.name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
