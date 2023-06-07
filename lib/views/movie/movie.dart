import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/components/components.dart';

class MoviePage extends StatefulWidget {
  final String id;
  const MoviePage({super.key, required this.id});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final MovieDetailsService _movieDetailsService = MovieDetailsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _movieDetailsService.getMovie(widget.id),
      builder: (context, AsyncSnapshot<MovieDetails> snapshot) {
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

        MovieDetails movie = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: const DS1Text("Movie", fontSize: 14),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [MediaHeader(movie: movie)],
            ),
          ),
        );
      },
    );
  }
}
