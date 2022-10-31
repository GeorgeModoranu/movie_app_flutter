import 'package:flutter/cupertino.dart';

import '../movies/movie.dart';

class UpComingSection extends StatefulWidget {
  final String title ;
  final List<Movie> movies;
  const UpComingSection({Key? key, required this.title, required this.movies}) : super(key: key);

  @override
  State<UpComingSection> createState() => _UpComingSectionState();
}

class _UpComingSectionState extends State<UpComingSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                height: 240,
                child: PageView.builder(
                  itemCount: widget.movies.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Image(
                          image: NetworkImage(
                            widget.movies[index].backdropPath,
                          ),
                          fit: BoxFit.cover),
                    );
                  },
                ))
          ],
        )
    );
  }
}
