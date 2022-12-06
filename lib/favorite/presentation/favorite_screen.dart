import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/favorite/presentation/favorite_view_model.dart';
import 'package:movie_app/favorite/presentation/favorite_section_widget.dart';
import 'package:movie_app/movie/domain/movie.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoritesViewModel favoriteViewModel;

  @override
  void initState() {
    super.initState();
    favoriteViewModel = getIt<FavoritesViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder(
          future: favoriteViewModel.getAllFavoriteMovies(),
          builder: ((context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return FavoriteSectionWidget(movies: snapshot.requireData, removeFavorite: favoriteViewModel.removeFavoriteMovie);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
