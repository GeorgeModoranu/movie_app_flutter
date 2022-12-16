import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/auth/data/login_repository.dart';
import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/movie/presentation/screens/detail_screen.dart';
import 'package:movie_app/movie/presentation/screens/home_screen.dart';
import 'package:movie_app/auth/presentation/logging_screen.dart';

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
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
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
                  DetailsScreen(movieId: int.parse(state.params['movieId']!)),
            ),
          ]),
    ],
    redirect: (context, state) {
      final loginRepository = getIt<LoginRepository>();
      if (loginRepository.isLogin) {
        return null;
      } else {
        return '/login';
      }
    });
