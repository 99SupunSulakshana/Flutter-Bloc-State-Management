import 'package:bloc_project_wheather_app/data/models/movie_model.dart';

abstract class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<Result> movies;
  TrendingMoviesLoaded(this.movies);
}

class TrendingMoviesError extends TrendingMoviesState {
  final String message;
  TrendingMoviesError(this.message);
}
