import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Result movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(8.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Ink.image(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "${movie.title}",
            style: const TextStyle(
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
                fontSize: 10,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
