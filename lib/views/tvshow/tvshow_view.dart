import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '../../components/components.dart';
import 'package:http/http.dart' as http;
import '/dto/dto.dart';

class TvShowView extends StatefulWidget {
  final String id;
  const TvShowView({super.key, required this.id});

  @override
  State<TvShowView> createState() => _TvShowViewState();
}

class _TvShowViewState extends State<TvShowView> {
  final _mediaDetailsRepository = MediaDetailsRepository(http.Client());

  @override
  Widget build(BuildContext context) {
    final getTvShow = _mediaDetailsRepository.getTvShow(id: widget.id);

    return FutureBuilder(
      future: getTvShow,
      builder: (
        context,
        AsyncSnapshot<(TvShowDetails, http.Response)> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingView();
        }

        if (snapshot.hasError) {
          return const ErrorView();
        }

        var (TvShowDetails tvshow, _) = snapshot.data!;
        var tvshowDto = TvShowDto(tvshow);

        if (tvshow.name == null) {
          return const ErrorView();
        }

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            actions: [
              MediaInfo(tvShow: tvshowDto),
            ],
            title: PageTitle(title: tvshow.name!),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaHeader(tvshow: tvshowDto),

                const SectionDivider(),

                TvShowCreators(tvShowDto: tvshowDto),

                SectionDivider(condition: tvshowDto.hasCreatedBy),

                GridMenu(
                  items: [
                    if (tvshowDto.hasPosters)
                      GridMenuItem(
                        label: 'Posters',
                        icon: Icons.image,
                        onTap: () {
                          context.push(
                            '/tv/$widget.id/images',
                            extra: tvshowDto,
                          );
                        },
                      ),
                    if (tvshowDto.hasCredits)
                      GridMenuItem(
                        label: 'Credits',
                        icon: Icons.people,
                        onTap: () {
                          context.push(
                            '/tv/$widget.id/credits',
                            extra: tvshowDto,
                          );
                        },
                      ),
                    if (tvshowDto.hasRecommendations)
                      GridMenuItem(
                        label: 'Recommendations',
                        icon: Icons.thumb_up,
                        onTap: () {
                          context.push(
                            '/tv/$widget.id/recommendations',
                            extra: tvshowDto,
                          );
                        },
                      ),
                    if (tvshowDto.hasSimilar)
                      GridMenuItem(
                        label: 'Similar',
                        icon: Icons.movie,
                        onTap: () {
                          context.push(
                            '/tv/$widget.id/similar',
                            extra: tvshowDto,
                          );
                        },
                      ),
                  ],
                ),

                //keyword
                SectionDivider(condition: tvshowDto.hasKeywords),
                MediaKeywords(tvshow: tvshowDto),

                //overview
                SectionDivider(condition: tvshowDto.hasOverview),
                MediaOverview(tvshow: tvshowDto),

                //cast
                SectionDivider(condition: tvshowDto.hasCast),
                PersonHorizontalList(
                  title: 'Cast',
                  list: tvshowDto.cast,
                ),

                //seasons
                SectionDivider(condition: tvshowDto.hasSeasons),
                TvShowSeasons(
                  tvshow: tvshow,
                  maxWidth: MediaQuery.of(context).size.width,
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
