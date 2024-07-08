import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

class MovieDateFilter extends StatefulWidget {
  const MovieDateFilter({super.key});

  @override
  State<MovieDateFilter> createState() => _MovieDateFilterState();
}

class _MovieDateFilterState extends State<MovieDateFilter> with SharedState {
  Map<String, dynamic> getDecade(int startYear, int endYear) {
    return {
      "startYear": "$startYear",
      "endYear": "$endYear",
      "label": "${startYear.toString().substring(2)}' decade",
      "subtitle": "All Movies between $startYear and $endYear",
    };
  }

  List<Map<String, dynamic>> rangeOfYears() {
    List<Map<String, dynamic>> years = [];

    years.add(getDecade(1950, 1959));
    years.add(getDecade(1960, 1969));
    years.add(getDecade(1970, 1979));
    years.add(getDecade(1980, 1989));
    years.add(getDecade(1990, 1999));
    years.add(getDecade(2000, 2009));
    years.add(getDecade(2010, 2019));

    for (int year = 2024; year >= 1920; year--) {
      years.add(
        {
          "startYear": "$year",
          "endYear": "$year",
          "label": "$year",
          "subtitle": "All Movies released in $year",
        },
      );
    }

    return years;
  }

  @override
  Widget build(BuildContext context) {
    return VWButton(
      label: "Date: ${movieFilterState.dateLabel}",
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
                        Icons.calendar_today,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      onTap: () {
                        movieFilterState.setYears(
                          rangeOfYears()[index]["startYear"],
                          rangeOfYears()[index]["endYear"],
                          rangeOfYears()[index]["label"],
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
