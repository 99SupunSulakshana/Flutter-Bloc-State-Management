import 'package:bloc_project_wheather_app/core.errors/server_failer.dart';
import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:bloc_project_wheather_app/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTrendingMovies {
  final MovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<ServerFailure,List<Result>>> call() async {
    return await repository.getTrendingMovie();
  }
}
