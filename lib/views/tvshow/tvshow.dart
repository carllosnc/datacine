import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/components/components.dart';

class TvShowPage extends StatefulWidget {
  final String id;
  const TvShowPage({super.key, required this.id});

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> {
  final TvShowDetailsService _tvShowDetailsService = TvShowDetailsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _tvShowDetailsService.getTVShow(widget.id),
      builder: (context, AsyncSnapshot<TvShowDetails> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }

        TvShowDetails tvShowDetails = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: const DS1Text("TV Show", fontSize: 14),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [MediaHeader(tvshow: tvShowDetails)],
            ),
          ),
        );
      },
    );
  }
}
