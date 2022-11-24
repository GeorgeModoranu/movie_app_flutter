import 'package:flutter/material.dart';
import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/favorite/presentation/favorite_view_model.dart';
import 'package:movie_app/favorite/presentation/favorite_section_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late FavoriteViewModel favoriteViewModel;

  @override
  void initState() {
    super.initState();
    favoriteViewModel = getIt<FavoriteViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        StreamBuilder<List<FavoriteMovie>>(
            stream: favoriteViewModel.favoriteMovieStrem(),
            builder: (context, snapshot) {
              if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              return FavoriteSectionWidget(
                movies: snapshot.requireData,
              );
            }),
      ],
    );
  }
}
