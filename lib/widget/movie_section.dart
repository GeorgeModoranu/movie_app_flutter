import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/movie_model_mock.dart';
import '../movies/movie.dart';

class MovieSection extends StatefulWidget {
  final String title;
  final List<Movie> movies;

  const MovieSection({super.key, required this.title, required this.movies});

  @override
  State<MovieSection> createState() => _MovieSectionState();
}

class _MovieSectionState extends State<MovieSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(minWidth: 72),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  color: Colors.red),
              child: Text(widget.title),
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.movies[index].posterPath),
                                fit: BoxFit.cover),
                          ),
                          height: 160,
                          child: GestureDetector(
                            onTap: () {
                              context.goNamed("detailPage");
                            },
                          ),
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
