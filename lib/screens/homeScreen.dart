import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/movies/movie.dart';
import 'package:movie_app/presentation/movies_view_model.dart';
import 'package:movie_app/storage/di.iconfig.dart';
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
  final viewModel = getIt<MoviesViewModel>();
  late Stream<List<Movie>> _getMovies;
  @override
  void initState() {
    super.initState();
    _getMovies = viewModel.movieStream();
  }

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
      body: ListView(
        children: [
          Observer(builder: (context) {
            return viewModel.outInCinema.map(
                initial: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) => UpComingSection(
                    title: 'Out in Cinema', movies: value.data));
          }),
          const StarSection(title: 'Stars'),
          Observer(builder: (context) {
            return viewModel.topRatedMovies.map(
                initial: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) => MovieSection(
                    title: 'Top Rated Movies', movies: value.data));
          }),
          StreamBuilder<List<Movie>>(
              stream: _getMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return Text("error");
                else if (snapshot.connectionState == ConnectionState.waiting)
                  return CircularProgressIndicator();
                return MovieSection(
                    title: "Popula Movies", movies: snapshot.requireData);
              }),
          Observer(builder: (context) {
            return viewModel.nowPlayingMovies.map(
                initial: (_) =>
                    const Center(child: CircularProgressIndicator()),
                loading: (_) =>
                    const Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) =>
                    MovieSection(title: 'Airing Today', movies: value.data));
          })
        ],
      ),
    );
  }
}
