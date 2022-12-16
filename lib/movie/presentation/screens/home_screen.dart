import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:movie_app/favorite/presentation/favorite_screen.dart';
import 'package:movie_app/movie/presentation/widgets/movie_model.dart';
import 'package:movie_app/movie/presentation/widgets/movies_view_model.dart';
import 'package:movie_app/auth/presentation/logging_screen.dart';
import 'package:movie_app/movie/presentation/widgets/movie_section_widget.dart';
import 'package:movie_app/movie/presentation/widgets/star_section_widget.dart';
import 'package:movie_app/movie/presentation/widgets/upcoming_section_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewModel = getIt<MoviesViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE41F2D),
        elevation: 5,
        leading: Container(
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen())),
            child: Image.asset('assets/profileIcon.png'),
          ),
        ),
        actions: [
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoriteScreen())),
            child: const Icon(
              Icons.favorite,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: ListView(
        children: [
          Observer(builder: (context) {
            return viewModel.outInCinema.map(
                initial: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) => UpComingSectionWidget(
                    title: 'Out in Cinema', movies: value.data));
          }),
          const StarSectionWidget(title: 'Stars'),
          Observer(builder: (context) {
            return viewModel.allMovies.map(
                initial: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) => MovieSectionWidget(
                    title: "Popula Movies",
                    movies: value.data,
                    toggleFavorite: viewModel.toggleFavorite));
          }),
        ],
      ),
    );
  }
}
