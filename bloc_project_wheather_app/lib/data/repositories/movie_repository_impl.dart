import 'package:bloc_project_wheather_app/core.errors/server_exception.dart';
import 'package:bloc_project_wheather_app/core.errors/server_failer.dart';
import 'package:bloc_project_wheather_app/data/datasources/movie_remote_data_source.dart';
import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:bloc_project_wheather_app/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<ServerFailure, List<Result>>> getPopulatMovie() async {
    try {
      final List<Result> movies = await remoteDataSource.getPopularMovie();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure("Error!"));
    }
  }

  @override
  Future<Either<ServerFailure, List<Result>>> getTrendingMovie() async {
    try {
      final List<Result> movies = await remoteDataSource.getTrendingMovie();
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure("Error!"));
    }
  }

  @override
  Future<Either<ServerFailure, List<Result>>> searchMovie(String value) async {
    try {
      final List<Result> movies = await remoteDataSource.searchMovie(value);
      return Right(movies);
    } on ServerException {
      return Left(ServerFailure("Error!"));
    }
  }
}
