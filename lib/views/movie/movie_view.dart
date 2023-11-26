import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/imports/app.dart';
import 'package:vw/vw.dart';

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

            VWColumn(
              gap: 10,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                MediaInfo(
                  movie: movie,
                ),
                if (movie.hasPosters)
                  VWButton(
                    label: 'Posters',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.image_outlined,
                    onTap: () {
                      context.push(
                        '/movie/${widget.id}/images',
                        extra: movie,
                      );
                    },
                  ),
                if (movie.hasCredits)
                  VWButton(
                    label: 'Credits',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.people_outline,
                    onTap: () {
                      context.push(
                        '/movie/${widget.id}/credits',
                        extra: movie,
                      );
                    },
                  ),
                if (movie.hasRecommendations)
                  VWButton(
                    label: 'Recommendations',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.thumb_up_outlined,
                    onTap: () {
                      context.push(
                        '/movie/${widget.id}/recommendations',
                        extra: movie,
                      );
                    },
                  ),
                if (movie.hasSimilar)
                  VWButton(
                    label: 'Similar',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.movie_outlined,
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
