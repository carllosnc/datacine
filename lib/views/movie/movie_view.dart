import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/components/components.dart';
import 'package:http/http.dart' as http;

class MovieView extends StatelessWidget {
  final String id;

  MovieView({super.key, required this.id});

  final _mediaDetailsRepository = MediaDetailsRepository(http.Client());

  @override
  Widget build(BuildContext context) {
    final Future<(MovieDetails, http.Response)> getMovie =
        _mediaDetailsRepository.getMovie(id: id);

    return FutureBuilder(
      future: getMovie,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingView();
        }

        if (snapshot.hasError) {
          return const ErrorView();
        }

        var (MovieDetails movie, _) = snapshot.data!;

        if (movie.title == null) {
          return const ErrorView();
        }

        // conditions for sections to be displayed
        bool hasKeywords = movie.keywords!['keywords'] != null &&
            movie.keywords!['keywords']!.isNotEmpty;
        bool hasCollection = movie.belongsToCollection != null;
        bool hasCast = movie.credits?['cast'] != null &&
            movie.credits!['cast']!.isNotEmpty &&
            movie.credits!['cast']!.length >= 3;
        bool hasOverview = movie.overview != null && movie.overview!.isNotEmpty;
        bool hasTagline = movie.tagline != null && movie.tagline!.isNotEmpty;

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            title: PageTitle(text: movie.title!),
            actions: [
              MediaInfo(movie: movie),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaHeader(movie: movie),

                //keyword
                SectionDivider(condition: hasKeywords),
                MediaKeywords(movie: movie),

                //overview
                SectionDivider(condition: hasOverview || hasTagline),
                MediaOverview(movie: movie),

                //cast
                SectionDivider(condition: hasCast),
                PersonHorizontalList(
                  title: '· Cast',
                  list: movie.credits?['cast']!,
                  maxWidth: double.infinity,
                ),

                //collection
                SectionDivider(condition: hasCollection),
                MovieCollection(movie: movie),
                const SizedBox(height: 110),
              ],
            ),
          ),
          bottomNavigationBar: BottomMenu(
            items: [
              BottomItem(
                icon: Icons.image_outlined,
                label: "Images",
                onTap: () {
                  context.push(
                    '/movie/${movie.id}/images',
                    extra: movie,
                  );
                },
              ),
              BottomItem(
                icon: Icons.person_outline,
                label: "Credits",
                onTap: () {
                  context.push(
                    '/movie/${movie.id}/credits',
                    extra: movie,
                  );
                },
              ),
              BottomItem(
                icon: Icons.thumb_up_outlined,
                label: "Recom.",
                onTap: () {
                  context.push(
                    '/movie/${movie.id}/recommendations',
                    extra: movie,
                  );
                },
              ),
              BottomItem(
                icon: Icons.movie_outlined,
                label: "Similar",
                onTap: () {
                  context.push(
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
