import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/auth/presentation/login_view_model.dart';
import 'package:movie_app/core/di.iconfig.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(scaffoldBackgroundColor: const Color(0xffe41f2d)),
        child: const LoginContent());
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/Vector.png',
            width: double.infinity, fit: BoxFit.fill),
        Image.asset('assets/Logo.png')
      ],
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  late final TextEditingController password, userName;
  late final LoginViewModel viewModel;
  @override
  void initState() {
    super.initState();
    userName = TextEditingController();
    password = TextEditingController();
    viewModel = getIt<LoginViewModel>();
    when((_) => viewModel.succesLogin, () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.goNamed('homeScreen');
      });
    });
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Header(),
              Text('Welcome',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white)),
              SizedBox(height: 8),
              Text('Please enter your credentials',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 40),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48, right: 48, bottom: 60, top: 16),
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xffb3b3b3)),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 56),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xfff7c04a),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text('Login'),
                        onPressed: () {
                          viewModel.logIn(userName.text, password.text);
                        },
                      ),
                    ),
                    Observer(builder: (context) {
                      return viewModel.login.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        error: (value) => Text(value.error),
                      );
                    })
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
