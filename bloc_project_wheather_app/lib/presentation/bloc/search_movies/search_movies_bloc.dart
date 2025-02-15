import 'package:bloc_project_wheather_app/presentation/bloc/search_movies/search_movies_event.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/search_movies/search_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/search_movies.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;

  SearchMoviesBloc({required this.searchMovies})
      : super(SearchMoviesInitial()) {
    on<FetchSearchMovies>((event, emit) async {
      emit(SearchMoviesLoading());
      final failureOrMovies = await searchMovies(event.query);
      failureOrMovies.fold(
          (failture) => emit(SearchMoviesError(failture.toString())),
          (movies) => emit(SearchMoviesLoaded(movies)));
    });
  }
}
