import 'package:flutter/material.dart';
import '/imports/app.dart';

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
      return AppColors.rattingGreat;
    } else if (vote >= 7) {
      return AppColors.rattingGood;
    } else if (vote >= 4) {
      return AppColors.rattingOk;
    }

    return AppColors.rattingBad;
  }

  @override
  Widget build(BuildContext context) {
    var hasNoVotes = voteAverage == 0 && status == null;
    var hasStatus = voteAverage == 0 && status != null;
    var voteName = voteCount == 1 ? 'VOTE' : 'VOTES';
    var voteAverageFormated = voteAverage!.toString().substring(0, 3);

    if (hasNoVotes) return const SizedBox.shrink();

    if (hasStatus) {
      return Text(
        status.toString().toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11,
          color: AppColors.status,
        ),
      );
    }

    return Wrap(
      spacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
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
              voteAverageFormated,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Wrap(
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              voteCount.toString(),
              style: TextStyle(
                fontSize: 12,
                color: AppColors.label,
              ),
            ),
            Text(
              voteName,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.label,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
