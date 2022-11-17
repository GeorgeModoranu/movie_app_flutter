import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/mobx/movie_api.dart';
import 'package:movie_app/mobx/movie_repository.dart';
import 'package:movie_app/movies/moive_dao.dart';
import 'package:movie_app/networking/networking.dart';
import 'package:movie_app/presentation/movies_view_model.dart';
import 'package:movie_app/screens/screens.dart';
import 'package:movie_app/storage/app_database.dart';
import 'package:movie_app/storage/di.iconfig.dart';
import 'package:movie_app/storage/storage_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  //initialLocation: '/homeScreen',
  routes: [
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) { return const LoginScreen();},
    ),
    GoRoute(
        name: 'homeScreen',
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: 'detailPage',
            path: 'detailPage/:movieId',
            builder: (context, state) =>
                DetailPage(movieId: int.parse(state.params['movieId']!)),
          ),
        ]),
  ],
);
