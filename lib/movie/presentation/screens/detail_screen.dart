import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/presentation/widgets/movie_details_view_model.dart';
import 'package:movie_app/movie/presentation/widgets/movie_details_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.movieId}) : super(key: key);
  final int movieId;
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late MovieDetailsViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt<MovieDetailsViewModel>(param1: widget.movieId);
  }

  @override
  void didUpdateWidget(covariant DetailsScreen oldWidget) {
    if (widget.movieId != oldWidget.movieId) {
      viewModel = getIt<MovieDetailsViewModel>(param1: widget.movieId);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Details'),
          backgroundColor: Colors.red,
          elevation: 5,
          actions: [
            IconButton(
                onPressed: viewModel.toggleFavourites,
                //viewModel.isFavourite.value = false;
                icon: Observer(
                  builder: (BuildContext context) => viewModel.isFavourite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                )
                //icon: const Icon(Icons.favorite),
                )
          ]),
      body: Column(
        children: [
          Observer(builder: (context) {
            return viewModel.movieDetails.map(
                initial: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) => MovieDetailsWidget(movie: value.data));
          }),
          StreamBuilder<List<FavoriteMovie>>(
              stream: viewModel.favoriteMovieStrem(),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Text(snapshot.error.toString());
                else if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();
                return Text(snapshot.requireData.toString());
              }),
        ],
      ),
    );
  }
}
