import 'package:ds1/components/text/text.dart';
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

  Color getVoteColor(num vote) {
    if (vote >= 8) {
      return ProjectColors.ratingGreat;
    } else if (vote >= 7) {
      return ProjectColors.ratingGood;
    } else if (vote >= 4) {
      return ProjectColors.ratingOk;
    }

    return ProjectColors.ratingBad;
  }

  @override
  Widget build(BuildContext context) {
    if (voteAverage == 0 && status == null) return const SizedBox.shrink();

    if (voteAverage == 0 && status != null) {
      return DS1Text(
        status.toString().toUpperCase(),
        bold: true,
        fontSize: 11,
        fontColor: ProjectColors.status,
      );
    }

    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Opacity(
          opacity: 0.5,
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              DS1Text(voteCount.toString(), fontSize: 12),
              const DS1Text("Votes", fontSize: 12),
            ],
          ),
        ),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: getVoteColor(voteAverage!),
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(
            child: DS1Text(
              voteAverage!.toString().substring(0, 3),
              fontSize: 15,
              bold: true,
            ),
          ),
        )
      ],
    );
  }
}
