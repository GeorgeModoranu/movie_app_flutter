import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/movie/presentation/widgets/movie_model.dart';

import '../../domain/movie.dart';

class MovieSectionWidget extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  final Function(int movieId, bool favorite) toggleFavorite;
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
              constraints: const BoxConstraints(minWidth: 72),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  color: Colors.red),
              child: Text(title),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieItem(
                      movieModel: movies[index],
                      toggleFavorite: toggleFavorite);
                }),
          )
        ],
      ),
    );
  }
}

class MovieItem extends StatelessWidget {
  const MovieItem({
    Key? key,
    required this.movieModel,
    required this.toggleFavorite,
  }) : super(key: key);

  final MovieModel movieModel;
  final Function(int movieId, bool favorite) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 130,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(movieModel.movie.posterPath),
                  fit: BoxFit.cover),
            ),
            height: 200,
            child: GestureDetector(
              onTap: () {
                context.goNamed('detailPage',
                    params: {'movieId': movieModel.movie.id.toString()});
              },
            ),
          ),
          const SizedBox(height: 4),
          Container(
            margin: EdgeInsets.only(left: 90, top: 145),
            child: IconButton(
              onPressed: () =>
                  toggleFavorite(movieModel.movie.id, !movieModel.isFavorite),
              icon: movieModel.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.favorite_border_outlined,
                      size: 30,
                      color: Colors.red,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
