import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/movie/presentation/widgets/movie_model.dart';

import '../../domain/movie.dart';

class MovieSectionWidget extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  final Function(int movieId) toggleFavorite;
  const MovieSectionWidget(
      {super.key,
      required this.title,
      required this.movies,
      required this.toggleFavorite});

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
              child: Text(title),
            ),
          ),
          SizedBox(
            height: 190,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    movies[index].movie.posterPath),
                                fit: BoxFit.cover),
                          ),
                          height: 140,
                          child: GestureDetector(
                            onTap: () {
                              context.goNamed('detailPage', params: {
                                'movieId': movies[index].movie.id.toString()
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 4),
                        IconButton(
                          onPressed: () =>
                              toggleFavorite(movies[index].movie.id),
                          icon: movies[index].isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  size: 20,
                                  color: Colors.red,
                                )
                              : const Icon(
                                  Icons.favorite_border_outlined,
                                  size: 20,
                                  color: Colors.red,
                                ),
                        )
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
