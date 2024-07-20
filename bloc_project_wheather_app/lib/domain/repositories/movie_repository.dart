import 'package:bloc_project_wheather_app/core.errors/server_failer.dart';
import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure,List<Result>>> getTrendingMovie();
  Future<Either<ServerFailure,List<Result>>> searchMovie(String value);
  Future<Either<ServerFailure,List<Result>>> getPopulatMovie();
}
