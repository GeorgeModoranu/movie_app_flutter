import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app/movies/movie.dart';

class MovieDetailsWidget extends StatelessWidget {
  final Movie movie;
  const MovieDetailsWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Card(
            child: Container(
              height: 450,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(movie.posterPath))),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          movie.originalTitle,
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
