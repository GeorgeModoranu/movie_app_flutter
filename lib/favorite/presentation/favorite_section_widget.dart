import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';

import '../../movie/domain/movie.dart';

class FavoriteSectionWidget extends StatelessWidget {
  final List<Movie> movies;
  final Function(int movieId) removeFavorite;
  const FavoriteSectionWidget(
      {super.key, required this.movies, required this.removeFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(7),
                      width: 100,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  movies[index].posterPath),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Expanded(child: Text(movies[index].title)),
                    const SizedBox(
                      width: 32,
                    ),
                    IconButton(
                        onPressed: () => removeFavorite,
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
    );
  }
}
