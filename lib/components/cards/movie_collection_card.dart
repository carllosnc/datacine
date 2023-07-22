import 'package:flutter/material.dart';
import '/domain/domain.dart';
import 'package:go_router/go_router.dart';
import '/core/core.dart';
import '/components/components.dart';

class MovieCollectionCard extends StatelessWidget {
  final MediaItem movie;
  const MovieCollectionCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.push('/movie/${movie.id.toString()}');
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color: ProjectColors(context).featured,
                  width: 1,
                ),
              ),
              height: 200 * 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageComponent(
                  imagePath: movie.posterPath,
                  imageType: ImageType.poster,
                  imageSize: ImageSize.posterW342,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                movie.title!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  color: ProjectColors(context).featured,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                (movie.releaseDate ?? '').formatDateTime(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  color: ProjectColors(context).text,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
