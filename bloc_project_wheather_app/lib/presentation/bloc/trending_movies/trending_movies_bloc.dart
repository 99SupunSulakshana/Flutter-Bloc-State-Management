import 'package:bloc_project_wheather_app/domain/usecases/get_trending_movies.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc({required this.getTrendingMovies})
      : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold(
          (failture) => emit(TrendingMoviesError(failture.toString())),
          (movies) => emit(TrendingMoviesLoaded(movies)));
    });
  }
}
