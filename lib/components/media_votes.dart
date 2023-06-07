import 'package:ds1/components/text/text.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    Color voteColor = Colors.red;
    num vote = voteAverage?.round() ?? 0;

    if (vote == 0 && status == null) return const SizedBox.shrink();

    if (voteAverage == 0 && status != null) {
      return DS1Text(
        status.toString().toUpperCase(),
        bold: true,
        fontSize: 11,
        fontColor: const Color.fromARGB(255, 225, 99, 247),
      );
    }

    if (vote >= 8) {
      voteColor = const Color.fromARGB(255, 36, 147, 40);
    } else if (vote >= 6) {
      voteColor = const Color.fromARGB(255, 21, 82, 237);
    } else if (vote >= 4) {
      voteColor = const Color.fromARGB(255, 178, 108, 4);
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
            )),
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: voteColor,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Center(
              child: DS1Text(
            vote.toString(),
            fontSize: 15,
            bold: true,
          )),
        )
      ],
    );
  }
}
