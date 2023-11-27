import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

class TvShowView extends StatefulWidget {
  final String id;
  const TvShowView({super.key, required this.id});

  @override
  State<TvShowView> createState() => _TvShowViewState();
}

class _TvShowViewState extends State<TvShowView> with TvShowService {
  @override
  void initState() {
    super.initState();
    fetchTvShow(id: widget.id);
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
            MediaHeader(tvshow: tvShow),

            SectionDivider(condition: tvShow.hasCreatedBy),

            TvShowCreators(tvShowDto: tvShow),

            const SectionDivider(),

            VWColumn(
              gap: 10,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                MediaInfo(
                  tvShow: tvShow,
                ),
                if (tvShow.hasPosters)
                  VWButton(
                    label: 'Posters',
                    leftIcon: Icons.image_outlined,
                    horizontalAlignment: MainAxisAlignment.start,
                    color: AppColors.buttonColor,
                    onTap: () {
                      context.push(
                        '/tv/$widget.id/images',
                        extra: tvShow,
                      );
                    },
                  ),
                if (tvShow.hasCredits)
                  VWButton(
                    label: 'Credits',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.people_outline,
                    color: AppColors.buttonColor,
                    onTap: () {
                      context.push(
                        '/tv/$widget.id/credits',
                        extra: tvShow,
                      );
                    },
                  ),
                if (tvShow.hasRecommendations)
                  VWButton(
                    label: 'Recommendations',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.thumb_up_outlined,
                    color: AppColors.buttonColor,
                    onTap: () {
                      context.push(
                        '/tv/$widget.id/recommendations',
                        extra: tvShow,
                      );
                    },
                  ),
                if (tvShow.hasSimilar)
                  VWButton(
                    label: 'Similar',
                    horizontalAlignment: MainAxisAlignment.start,
                    leftIcon: Icons.movie_outlined,
                    color: AppColors.buttonColor,
                    onTap: () {
                      context.push(
                        '/tv/$widget.id/similar',
                        extra: tvShow,
                      );
                    },
                  ),
              ],
            ),

            //keyword
            SectionDivider(condition: tvShow.hasKeywords),
            MediaKeywords(tvshow: tvShow),

            //overview
            SectionDivider(condition: tvShow.hasOverview),
            MediaOverview(tvshow: tvShow),

            //cast
            SectionDivider(condition: tvShow.hasCast),
            PersonHorizontalList(
              title: 'Cast',
              list: tvShow.cast,
            ),

            //seasons
            SectionDivider(condition: tvShow.hasSeasons),
            TvShowSeasons(
              tvshow: tvShow,
              maxWidth: MediaQuery.of(context).size.width,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
