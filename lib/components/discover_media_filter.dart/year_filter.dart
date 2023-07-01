import 'package:flutter/material.dart';

class YearsFilter extends StatefulWidget {
  final Function(dynamic) onChanged;

  const YearsFilter({super.key, required this.onChanged});

  @override
  State<YearsFilter> createState() => _YearsFilterState();
}

class _YearsFilterState extends State<YearsFilter> {
  Map<String, dynamic> years = {};

  var rangeOfyears = {
    for (var v in List.generate(2023 - 1899, (i) => 2023 - i)) '$v': '$v'
  };

  var decade60 = {
    '60\' Decade': '1960,1961,1962,1963,1964,1965,1966,1967,1968,1969'
  };

  var decade70 = {
    '70\' Decade': '1970,1971,1972,1973,1974,1975,1976,1977,1978,1979'
  };

  var decade80 = {
    '80\' Decade': '1980,1981,1982,1983,1984,1985,1986,1987,1988,1989'
  };

  var decade90 = {
    '90\' Decade': '1990,1991,1992,1993,1994,1995,1996,1997,1998,1999'
  };

  var decade00 = {
    '00\' Decade': '2000,2001,2002,2003,2004,2005,2006,2007,2008,2009'
  };

  late String currentYear;

  @override
  void initState() {
    super.initState();

    years.addAll({'All': null});
    years.addAll(decade60);
    years.addAll(decade70);
    years.addAll(decade80);
    years.addAll(decade90);
    years.addAll(decade00);
    years.addAll(rangeOfyears);

    currentYear = years.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Year: '),
        SizedBox(
          width: 220,
          child: DropdownButtonFormField(
            value: currentYear,
            icon: const Icon(Icons.expand_more),
            padding: EdgeInsets.zero,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.calendar_month),
            ),
            items: years.keys.map((year) {
              return DropdownMenuItem(
                value: year,
                child: Text(year.toString()),
              );
            }).toList(),
            onChanged: (values) {
              setState(() {
                currentYear = values.toString();

                widget.onChanged(years[currentYear]);
              });
            },
          ),
        ),
      ],
    );
  }
}
