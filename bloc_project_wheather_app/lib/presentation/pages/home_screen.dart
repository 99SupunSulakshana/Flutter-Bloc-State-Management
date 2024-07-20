import 'package:bloc_project_wheather_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/popular_movies/popular_movies_state.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:bloc_project_wheather_app/presentation/pages/movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final backgroundImage =
      "https://images.pexels.com/photos/1266810/pexels-photo-1266810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi,",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("Movie App",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 290,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(backgroundImage),
                        fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            child:
                                const Text("Learn Flutter with Flutter Guys"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Trending Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
                  builder: (context, state) {
                if (state is TrendingMoviesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is TrendingMoviesLoaded) {
                  return MovieList(movies: state.movies);
                } else if (state is TrendingMoviesError) {
                  return Text(state.message);
                }
                return Container();
              }),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Popular Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                  builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return const CircularProgressIndicator();
                } else if (state is PopularMoviesLoaded) {
                  return MovieList(movies: state.movies);
                } else if (state is PopularMoviesError) {
                  return Text(state.message);
                }
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
