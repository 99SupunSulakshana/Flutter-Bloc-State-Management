import 'package:bloc_project_wheather_app/core.errors/server_exception.dart';
import 'package:bloc_project_wheather_app/data/datasources/movie_remote_data_source.dart';
import 'package:bloc_project_wheather_app/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "51cb1af93e23f382d3d0f377acb0892d";

  @override
  Future<List<Result>> getPopularMovie() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = movieFromJson(response.body);
      return responseBody.results ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Result>> getTrendingMovie() async {
    final response = await client
        .get(Uri.parse("$BASE_URL/trending/movie/day?api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = movieFromJson(response.body);
      return responseBody.results ?? [];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<Result>> searchMovie(String query) async {
    final response = await client
        .get(Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY"));
    if (response.statusCode == 200) {
      final responseBody = movieFromJson(response.body);
      return responseBody.results ?? [];
    } else {
      throw ServerException();
    }
  }
}
