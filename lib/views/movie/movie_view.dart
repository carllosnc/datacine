import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/imports/app.dart';

class MovieView extends StatefulWidget {
  final String id;

  const MovieView({super.key, required this.id});

  @override
  State<MovieView> createState() => MovieViewState();
}

class MovieViewState extends State<MovieView> with MovieService {
  @override
  void initState() {
    super.initState();
    fetchMovie(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: LoadingView(),
      );
    }

    if (isError) {
      return const Scaffold(
        body: ErrorView(),
      );
    }

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(10),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(1),
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaHeader(movie: movie),

            SectionDivider(condition: movie.hasDirectors),

            MovieDirectors(movie: movie),

            const SectionDivider(),

            GridMenu(
              items: [
                MediaInfo(movie: movie),
                if (movie.hasPosters)
                  GridMenuItem(
                    label: 'Posters',
                    icon: Icons.image,
                    onTap: () {
                      context.push(
                        '/movie/${widget.id}/images',
                        extra: movie,
                      );
                    },
                  ),
                if (movie.hasCredits)
                  GridMenuItem(
                    label: 'Credits',
                    icon: Icons.people,
                    onTap: () {
                      context.push(
                        '/movie/${widget.id}/credits',
                        extra: movie,
                      );
                    },
                  ),
                if (movie.hasRecommendations)
                  GridMenuItem(
                    label: 'Recommendations',
                    icon: Icons.thumb_up,
                    onTap: () {
                      context.push(
                        '/movie/${widget.id}/recommendations',
                        extra: movie,
                      );
                    },
                  ),
                if (movie.hasSimilar)
                  GridMenuItem(
                    label: 'Similar',
                    icon: Icons.movie,
                    onTap: () {
                      context.push(
                        '/movie/${widget.id}/similar',
                        extra: movie,
                      );
                    },
                  ),
              ],
            ),

            //keyword
            SectionDivider(condition: movie.hasKeywords),
            MediaKeywords(movie: movie),

            //overview
            SectionDivider(
              condition: movie.hasOverview || movie.hasTagline,
            ),
            MediaOverview(movie: movie),

            //cast
            SectionDivider(condition: movie.hasCast),
            PersonHorizontalList(
              title: 'Cast',
              list: movie.cast,
            ),

            //collection
            SectionDivider(condition: movie.hasCollection),
            MovieCollection(movie: movie),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
