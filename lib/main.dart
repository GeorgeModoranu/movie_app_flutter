import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/screens/screens.dart';
import 'package:movie_app/storage/storage_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageModule.getInstance().initModule();
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
  initialLocation: '/login',
  routes: [
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
        name: 'homeScreen',
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: 'detailPage',
            path: 'detailPage',
            builder: (context, state) => const DetailPage(),
          ),
        ]),
  ],
);
