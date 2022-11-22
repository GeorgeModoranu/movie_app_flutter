import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/movie/presentation/screens/detailPage.dart';
import 'package:movie_app/movie/presentation/screens/homeScreen.dart';
import 'package:movie_app/movie/presentation/screens/loggingScreen.dart';

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
                DetailPage(movieId: int.parse(state.params['movieId']!)),
          ),
        ]),
  ],
  // redirect: (context, state) {
  //   final loginRepository = getIt<LoginRepository>();
  //   if (loginRepository.isLogin) {
  //     return null;
  //   } else {
  //     return '/login';
  //   }
  // }
);
