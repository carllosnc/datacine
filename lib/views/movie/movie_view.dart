import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '../../components/components.dart';
import 'package:http/http.dart' as http;
import '/dto/dto.dart';

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
        var movieDto = MovieDto(movie);

        if (!movieDto.hasTitle) {
          return const ErrorView();
        }

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            title: PageTitle(title: movieDto.title),
            actions: [
              MediaInfo(movie: movieDto),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaHeader(movie: movieDto),

                const SectionDivider(),

                MovieDirectors(movie: movieDto),

                SectionDivider(condition: movieDto.hasDirectors),

                GridMenu(
                  items: [
                    if (movieDto.hasPosters)
                      GridMenuItem(
                        label: 'Posters',
                        icon: Icons.image,
                        onTap: () {
                          context.push(
                            '/movie/$id/images',
                            extra: movieDto,
                          );
                        },
                      ),
                    if (movieDto.hasCredits)
                      GridMenuItem(
                        label: 'Credits',
                        icon: Icons.people,
                        onTap: () {
                          context.push(
                            '/movie/$id/credits',
                            extra: movieDto,
                          );
                        },
                      ),
                    if (movieDto.hasRecommendations)
                      GridMenuItem(
                        label: 'Recommendations',
                        icon: Icons.thumb_up,
                        onTap: () {
                          context.push(
                            '/movie/$id/recommendations',
                            extra: movieDto,
                          );
                        },
                      ),
                    if (movieDto.hasSimilar)
                      GridMenuItem(
                        label: 'Similar',
                        icon: Icons.movie,
                        onTap: () {
                          context.push(
                            '/movie/$id/similar',
                            extra: movieDto,
                          );
                        },
                      ),
                  ],
                ),

                //keyword
                SectionDivider(condition: movieDto.hasKeywords),
                MediaKeywords(movie: movieDto),

                //overview
                SectionDivider(
                  condition: movieDto.hasOverview || movieDto.hasTagline,
                ),
                MediaOverview(movie: movieDto),

                //cast
                SectionDivider(condition: movieDto.hasCast),
                PersonHorizontalList(
                  title: 'Cast',
                  list: movieDto.cast,
                  maxWidth: double.infinity,
                ),

                //collection
                SectionDivider(condition: movieDto.hasCollection),
                MovieCollection(movie: movieDto),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
