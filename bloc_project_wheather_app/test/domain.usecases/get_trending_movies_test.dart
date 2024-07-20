import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:bloc_project_wheather_app/domain/repositories/movie_repository.dart';
import 'package:bloc_project_wheather_app/domain/usecases/get_trending_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_trending_movies_test.mocks.dart';

//class MockMovieRepository extends Mock implements MovieRepository {}

@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main() {
  late GetTrendingMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = GetTrendingMovies(mockMovieRepository);
  });

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

  test("should get trending movies from the repository", () async {
    // arrange
    when(mockMovieRepository.getTrendingMovie())
        .thenAnswer((_) async => Right(tMoviesList));
    // act
    final result = await usecase();
    // assert
    expect(result, equals(Right(tMoviesList)));
    verify(mockMovieRepository.getTrendingMovie());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
