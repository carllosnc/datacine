import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/core/core.dart';
import '/components/components.dart';

class MediaPage extends StatefulWidget {
  final String id;
  const MediaPage({super.key, required this.id});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  final MovieDetailsService _movieDetailsService = MovieDetailsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _movieDetailsService.getMovie(widget.id),
      builder: (context, AsyncSnapshot<MovieDetails> snapshot) {
        //loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        //error
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }

        MovieDetails movie = snapshot.data!;
        var width = MediaQuery.of(context).size.width - 40;
        var height = width * 1.5;

        return Scaffold(
          appBar: AppBar(
            title: const DS1Text("Movie", fontSize: 14),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image
                Center(
                  child: SizedBox(
                    width: width,
                    height: height,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: ImageComponent(
                          imagePath: movie.posterPath,
                          imageType: ImageType.poster,
                          imageSize: ImageSize.posterW500,
                        ),
                      ),
                    ),
                  ),
                ),

                //Info
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DS1Text(
                        DateHelper.format(movie.releaseDate!),
                        fontSize: 14,
                        fontColor: Colors.yellow,
                      ),
                      const SizedBox(height: 5),
                      DS1Text(movie.title!, fontSize: 18),
                      const SizedBox(height: 20),
                      const DS1Button(
                        label: "Watch Trailer",
                        icon: Icons.play_arrow,
                      )
                    ],
                  ),
                ),

                const Divider(height: 1)
              ],
            ),
          ),
        );
      },
    );
  }
}
