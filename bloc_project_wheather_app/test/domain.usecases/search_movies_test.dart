import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:bloc_project_wheather_app/domain/repositories/movie_repository.dart';
import 'package:bloc_project_wheather_app/domain/usecases/search_movies.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_trending_movies_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main() {
  late SearchMovies usecase;
  late MockMovieRepository mockMovieRepository;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase = SearchMovies(mockMovieRepository);
  });

  final tMoviesList = [
    Result(
        id: 1, title: "Test Movie 1", overview: "Desc 1", posterPath: "/image1")
  ];

  const tQuery = "inception";

  test("should get movies from the query from the repository", () async {
    when(mockMovieRepository.searchMovie(any))
        .thenAnswer((realInvocation) async => Right(tMoviesList));

    // act
    final result = await usecase(tQuery);

    // asserts
    expect(result, equals(Right(tMoviesList)));
    verify(mockMovieRepository.searchMovie(any));
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
