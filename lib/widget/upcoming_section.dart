import 'package:flutter/cupertino.dart';

import '../movies/movie.dart';

class UpComingSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  const UpComingSection({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 240,
            child: PageView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Image(
                      image: NetworkImage(
                        movies[index].backdropPath,
                      ),
                      fit: BoxFit.cover),
                );
              },
            ))
      ],
    ));
  }
}
