import 'package:flutter/material.dart';
import '/imports.dart';
import 'package:vw/vw.dart';
import '../components/movie_collection.dart';
import '../components/movie_directors.dart';
import '../components/media_header.dart';
import '../components/media_info/media_info.dart';
import '../components/media_keywords.dart';
import '../components/media_overview.dart';
import '../components/media_recommendations.dart';
import '../components/media_similar.dart';

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
                    color: AppColors.buttonColor,
                    onTap: () {
                      showMediaPosters(
                        context: context,
                        posters: movie.posters,
                        title: movie.title,
                      );
                    },
                  ),
                if (movie.hasCredits)
                  VWButton(
                    label: 'Credits',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.people_outline,
                    color: AppColors.buttonColor,
                    onTap: () {
                      showMediaCreditList(
                        context: context,
                        credits: movie.credits!,
                        title: movie.title,
                      );
                    },
                  ),
                if (movie.hasRecommendations)
                  VWButton(
                    label: 'Recommendations',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.thumb_up_outlined,
                    color: AppColors.buttonColor,
                    onTap: () {
                      showMediaRecommendations(
                        context: context,
                        movie: movie,
                        mediaType: MediaType.movie,
                      );
                    },
                  ),
                if (movie.hasSimilar)
                  VWButton(
                    label: 'Similar',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.movie_outlined,
                    color: AppColors.buttonColor,
                    onTap: () {
                      showMediaSimilar(
                        context: context,
                        mediaType: MediaType.movie,
                        movie: movie,
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
