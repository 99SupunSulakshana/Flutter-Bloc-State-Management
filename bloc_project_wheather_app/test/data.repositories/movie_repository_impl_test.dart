import 'package:bloc_project_wheather_app/core.errors/server_exception.dart';
import 'package:bloc_project_wheather_app/core.errors/server_failer.dart';
import 'package:bloc_project_wheather_app/data/datasources/movie_remote_data_source.dart';
import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:bloc_project_wheather_app/data/repositories/movie_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    repository =
        MovieRepositoryImpl(remoteDataSource: mockMovieRemoteDataSource);
  });

  final tMoviesModelList = [
    Result(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    Result(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/images2")
  ];

  final tMoviesList = [
    Result(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    Result(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/images2")
  ];

  const String tQuery = '';

  test('should get trending movies from the remote data source', () async {
    when(mockMovieRemoteDataSource.getTrendingMovie())
        .thenAnswer((_) async => tMoviesModelList);

    final result = await repository.getTrendingMovie();
    verify(mockMovieRemoteDataSource.getTrendingMovie());
    expect(result, isA<Right<Failture, List<Result>>>());
  });

  test('should get popular movies from the remote data source', () async {
    when(mockMovieRemoteDataSource.getPopularMovie())
        .thenAnswer((_) async => tMoviesModelList);

    final result = await repository.getPopulatMovie();
    verify(mockMovieRemoteDataSource.getPopularMovie());
    expect(result, isA<Right<Failture, List<Result>>>());
  });

  test('should search movies from the remote data source', () async {
    when(mockMovieRemoteDataSource.searchMovie(tQuery))
        .thenAnswer((_) async => tMoviesModelList);

    final result = await repository.searchMovie(tQuery);
    verify(mockMovieRemoteDataSource.searchMovie(tQuery));
    expect(result, isA<Right<Failture, List<Result>>>());
  });

  test(
      'should return ServerFailture when the call to popular movies remote data source is unsuccessful',
      () async {
    when(mockMovieRemoteDataSource.getPopularMovie())
        .thenThrow(ServerException());

    final result = await repository.getPopulatMovie();

    expect(result, isA<Left<ServerFailure, List<Result>>>());
  });

  test(
      'should return ServerFailture when the call to Thrending movies remote data source is unsuccessful',
      () async {
    when(mockMovieRemoteDataSource.getTrendingMovie())
        .thenThrow(ServerException());

    final result = await repository.getTrendingMovie();

    expect(result, isA<Left<ServerFailure, List<Result>>>());
  });

  test(
      'should return ServerFailture when the call to Serach movie remote data source is unsuccessful',
      () async {
    when(mockMovieRemoteDataSource.searchMovie(tQuery))
        .thenThrow(ServerException());

    final result = await repository.searchMovie(tQuery);

    expect(result, isA<Left<ServerFailure, List<Result>>>());
  });
}
