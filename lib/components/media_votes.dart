import 'package:flutter/material.dart';
import '/core/core.dart';

class MediaVotes extends StatelessWidget {
  final num? voteAverage;
  final num? voteCount;
  final String? status;

  const MediaVotes({
    super.key,
    required this.voteAverage,
    required this.voteCount,
    required this.status,
  });

  Color getVoteColor({required BuildContext context, required num vote}) {
    if (vote >= 8) {
      return ProjectColors(context).ratingGreat;
    } else if (vote >= 7) {
      return ProjectColors(context).ratingGood;
    } else if (vote >= 4) {
      return ProjectColors(context).ratingOk;
    }

    return ProjectColors(context).ratingBad;
  }

  @override
  Widget build(BuildContext context) {
    if (voteAverage == 0 && status == null) return const SizedBox.shrink();

    if (voteAverage == 0 && status != null) {
      return Text(
        status.toString().toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11,
          color: ProjectColors(context).status,
        ),
      );
    }

    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              voteCount.toString(),
              style: TextStyle(
                fontSize: 12,
                color: ProjectColors(context).label,
              ),
            ),
            Text(
              voteCount == 1 ? 'VOTE' : 'VOTES',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: ProjectColors(context).label,
              ),
            ),
          ],
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: getVoteColor(
              context: context,
              vote: voteAverage!,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(
            child: Text(
              voteAverage!.toString().substring(0, 3),
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
