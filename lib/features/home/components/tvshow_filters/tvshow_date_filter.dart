import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

class TvShowDateFilter extends StatefulWidget {
  const TvShowDateFilter({super.key});

  @override
  State<TvShowDateFilter> createState() => _TvShowDateFilterState();
}

class _TvShowDateFilterState extends State<TvShowDateFilter> with SharedState {
  List<Map<String, dynamic>> rangeOfYears() {
    List<Map<String, dynamic>> years = [];

    for (int year = 2024; year >= 1920; year--) {
      years.add(
        {
          "releaseYear": "$year",
          "label": "$year",
          "subtitle": "All TV Shows released in $year",
        },
      );
    }

    return years;
  }

  @override
  Widget build(BuildContext context) {
    return VWButton(
      label: tvShowFilterState.releaseYear,
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Release date filter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              body: VWBox(
                height: 1000,
                child: ListView.builder(
                  itemCount: rangeOfYears().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      onTap: () {
                        tvShowFilterState.setReleaseDate(
                          rangeOfYears()[index]["releaseYear"],
                        );

                        Navigator.pop(context);
                      },
                      title: Text(rangeOfYears()[index]["label"]),
                      subtitle: Text(
                        rangeOfYears()[index]["subtitle"],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
