import 'package:bloc_project_wheather_app/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<Result>> getTrendingMovie();
  Future<List<Result>> searchMovie(String query);
  Future<List<Result>> getPopularMovie();
}
