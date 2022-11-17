import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/movies/movie.dart';
import 'package:movie_app/presentation/movieDetails/movieDetails_view_model.dart';
import 'package:movie_app/storage/di.iconfig.dart';
import 'package:movie_app/widget/movie_details_widget.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.movieId}) : super(key: key);
  final int movieId;
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late MovieDetailsViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt<MovieDetailsViewModel>(param1: widget.movieId);
  }

  @override
  void didUpdateWidget(covariant DetailPage oldWidget) {
    if (widget.movieId != oldWidget.movieId) {
      viewModel = getIt<MovieDetailsViewModel>(param1: widget.movieId);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('Movie Details')),
      ),
      body: Observer(builder: (context) {
        return viewModel.movieDetails.map(
            initial: (_) => const Center(child: CircularProgressIndicator()),
            loading: (_) => const Center(child: CircularProgressIndicator()),
            error: (value) => Text(value.error),
            success: (value) => MovieDetailsWidget(movie: value.data));
      }),
    );
  }
}
