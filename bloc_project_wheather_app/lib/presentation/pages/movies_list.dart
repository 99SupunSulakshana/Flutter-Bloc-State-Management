import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:bloc_project_wheather_app/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movies});

  final List<Result> movies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(movies.length, (index) {
        final movie = movies[index];
        return MovieCard(movie: movie);
      })),
    );
  }
}
