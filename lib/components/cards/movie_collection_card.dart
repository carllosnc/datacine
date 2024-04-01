import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

class MovieCollectionCard extends StatelessWidget {
  final MediaItem movie;
  const MovieCollectionCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    var poster = ImageHelper.getPoster(
      path: movie.posterPath,
      size: ImageSize.posterW342,
    );

    return GestureDetector(
      onTap: () {
        context.push('/movie/${movie.id.toString()}');
      },
      child: SizedBox(
        width: 150,
        child: VWColumn(
          gap: 8,
          children: [
            Expanded(
              child: Imgy(
                src: poster,
                fullSrc: poster,
                borderRadius: BorderRadius.circular(7),
                width: double.infinity,
                placeholderColor: Colors.black,
              ),
            ),
            VWColumn(
              gap: 2,
              children: [
                Text(
                  movie.title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.link,
                  ),
                ),
                Text(
                  (movie.releaseDate ?? '').formatDateTime(),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.label,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
