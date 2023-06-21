import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/components/components.dart';

class MovieView extends StatelessWidget {
  final String id;

  MovieView({super.key, required this.id});

  final MediaDetailsService _movieDetailsService = MediaDetailsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _movieDetailsService.getMovie(id),
      builder: (context, AsyncSnapshot<MovieDetails> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }

        MovieDetails movie = snapshot.data!;
        bool hasKeywords = movie.keywords!['keywords'] != null &&
            movie.keywords!['keywords']!.isNotEmpty;
        bool hasCollection = movie.belongsToCollection != null;
        bool hasCast = movie.credits?['cast'] != null &&
            movie.credits!['cast']!.isNotEmpty &&
            movie.credits!['cast']!.length >= 3;
        bool hasOverview = movie.overview != null && movie.overview!.isNotEmpty;
        bool hasTagline = movie.tagline != null && movie.tagline!.isNotEmpty;
        bool hasGenres = movie.genres != null && movie.genres!.isNotEmpty;

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: DS1Text(movie.title!, fontSize: 14),
            actions: [
              MediaInfo(movie: movie),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaHeader(movie: movie),

                //genres
                SectionDivider(condition: hasGenres),
                MediaGenres(movie: movie),

                //keyword
                SectionDivider(condition: hasKeywords),
                MediaKeywords(movie: movie),

                //overview
                SectionDivider(condition: hasOverview || hasTagline),
                MediaOverview(movie: movie),

                //cast
                SectionDivider(condition: hasCast),
                PeopleList(
                  title: 'Cast',
                  list: movie.credits?['cast']!,
                  maxWidth: double.infinity,
                ),

                //collection
                SectionDivider(condition: hasCollection),
                MovieCollection(movie: movie, maxWidth: double.infinity),
                const SizedBox(height: 80),
              ],
            ),
          ),
          bottomNavigationBar: BottomMenu(
            items: [
              BottomItem(
                icon: Icons.image,
                label: "Images",
                onTap: () {
                  context.go(
                    '/movie/${movie.id}/images',
                    extra: movie,
                  );
                },
              ),
              BottomItem(
                icon: Icons.person,
                label: "Credits",
                onTap: () {
                  context.go(
                    '/movie/${movie.id}/credits',
                    extra: movie,
                  );
                },
              ),
              BottomItem(
                icon: Icons.thumb_up,
                label: "Recom.",
                onTap: () {
                  context.go(
                    '/movie/${movie.id}/recommendations',
                    extra: movie,
                  );
                },
              ),
              BottomItem(
                icon: Icons.movie,
                label: "Similar",
                onTap: () {
                  context.go(
                    '/movie/${movie.id}/similar',
                    extra: movie,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
