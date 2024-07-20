import 'package:bloc_project_wheather_app/data/models/movie_model.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoaded extends PopularMoviesState {
  final List<Result> movies;
  PopularMoviesLoaded(this.movies);
}

class PopularMoviesError extends PopularMoviesState {
  final String message;
  PopularMoviesError(this.message);
}