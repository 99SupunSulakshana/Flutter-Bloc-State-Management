import 'package:bloc_project_wheather_app/data/models/movie_model.dart';

abstract class SearchMoviesState {}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<Result> movies;
  SearchMoviesLoaded(this.movies);
}

class SearchMoviesError extends SearchMoviesState {
  final String message;
  SearchMoviesError(this.message);
}