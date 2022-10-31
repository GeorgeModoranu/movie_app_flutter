import 'package:flutter/material.dart';
import 'package:movie_app/presentation/movies_view_model.dart';
import 'package:movie_app/widget/movie_section.dart';
import 'package:movie_app/widget/star_section.dart';
import 'package:movie_app/widget/upcoming_section.dart';
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
  final viewModel = MoviesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.red,
          leading: Image.asset('assets/profileIcon.png'),
          actions: const [
            Icon(Icons.search, size: 45.0),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20))
          ],
        ),
        body:  ListView(
          children: [
            Observer(builder: (context) {
              return viewModel.outInCinema.map(
                  initial: (_) => Center(child: CircularProgressIndicator()),
                  loading: (_) => Center(child: CircularProgressIndicator()),
                  error: (value) => Text(value.error),
                  success: (value) =>
                      UpComingSection(title: 'Out in Cinema', movies: value.data));
            }),
            StarSection(title: 'Stars'),
            Observer(builder: (context) {
              return viewModel.topRatedMovies.map(
                  initial: (_) => Center(child: CircularProgressIndicator()),
                  loading: (_) => Center(child: CircularProgressIndicator()),
                  error: (value) => Text(value.error),
                  success: (value) =>
                      MovieSection(title: 'Top Rated Movies', movies: value.data));
            }),
            Observer(builder: (context) {
              return viewModel.popularMovies.map(
                  initial: (_) => Center(child: CircularProgressIndicator()),
                  loading: (_) => Center(child: CircularProgressIndicator()),
                  error: (value) => Text(value.error),
                  success: (value) =>
                      MovieSection(title: 'Popular movies', movies: value.data));
            }),
            Observer(builder: (context) {
              return viewModel.nowPlayingMovies.map(
                  initial: (_) => Center(child: CircularProgressIndicator()),
                  loading: (_) => Center(child: CircularProgressIndicator()),
                  error: (value) => Text(value.error),
                  success: (value) =>
                      MovieSection(title: 'Airing Today', movies: value.data));
            })
          ],
        ),
      );
  }
}
