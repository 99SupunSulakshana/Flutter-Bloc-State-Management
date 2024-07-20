import 'package:bloc_project_wheather_app/injection_connector.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:bloc_project_wheather_app/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:bloc_project_wheather_app/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter - Bloc Pattern',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies())),
        BlocProvider(create: (context) => getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies())),
        BlocProvider(create: (context) => getIt<SearchMoviesBloc>()),
      ], child: const HomeScreen()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
