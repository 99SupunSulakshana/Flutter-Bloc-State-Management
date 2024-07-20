import 'dart:io';

import 'package:bloc_project_wheather_app/core.errors/server_exception.dart';
import 'package:bloc_project_wheather_app/data/datasources/movie_remote_data_source.dart';
import 'package:bloc_project_wheather_app/data/datasources/remote/movie_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'movie_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MovieRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  const tQuery = 'Avengers';

  const tUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=51cb1af93e23f382d3d0f377acb0892d';
  const pUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=51cb1af93e23f382d3d0f377acb0892d';
  const sUrl =
      'https://api.themoviedb.org/3/search/movie?query=$tQuery&api_key=51cb1af93e23f382d3d0f377acb0892d';

  const String sampleApiResponse = '''
{
  "page": 1,
  "results": [
        {
            "backdrop_path": "/tpiqEVTLRz2Mq7eLq5DT8jSrp71.jpg",
            "id": 934632,
            "original_title": "Rebel Moon - Part Two: The Scargiver",
            "overview": "The rebels gear up for battle against the Motherworld as unbreakable bonds are forged, heroes emerge — and legends are made.",
            "poster_path": "/cxevDYdeFkiixRShbObdwAHBZry.jpg",
            "media_type": "movie",
            "adult": false,
            "title": "Rebel Moon - Part Two: The Scargiver",
            "original_language": "en",
            "genre_ids": [
                878,
                28,
                18
            ],
            "popularity": 410.232,
            "release_date": "2024-04-19",
            "video": false,
            "vote_average": 6.0,
            "vote_count": 161
        }
    ],
    "total_pages": 1000,
    "total_results": 20000
}
''';

  test("should perform a GET request on a url to get trending movies",
      () async {
    //arrange
    when(mockHttpClient.get(Uri.parse(tUrl))).thenAnswer(
        (_) async => http.Response(sampleApiResponse, 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }));

    // act
    await dataSource.getTrendingMovie();

    // assert
    verify(mockHttpClient.get(Uri.parse(tUrl)));
  });

  test("should perform a GET request on a url to get popular movies", () async {
    //arrange
    when(mockHttpClient.get(Uri.parse(pUrl))).thenAnswer(
        (_) async => http.Response(sampleApiResponse, 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }));

    // act
    await dataSource.getPopularMovie();

    // assert
    verify(mockHttpClient.get(Uri.parse(pUrl)));
  });

  test("should perform a GET request on a url to search movies", () async {
    //arrange
    when(mockHttpClient.get(Uri.parse(sUrl))).thenAnswer(
        (_) async => http.Response(sampleApiResponse, 200, headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            }));

    // act
    await dataSource.searchMovie(tQuery);

    // assert
    verify(mockHttpClient.get(Uri.parse(sUrl)));
  });

  test("should throw a Server Exception when the response code is 404",
      () async {
    //arrange
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));

    // act
    final call = dataSource.getTrendingMovie;

    // assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });
}
