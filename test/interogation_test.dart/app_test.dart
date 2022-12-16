import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/main.dart';

void main() {
  setUpAll(() async {
    final binding =
        await IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  });
  setUp(() async {
    await configureInjection();
  });
  tearDown(() async {
    await getIt.reset();
  });
  testWidgets('login', (tester) async {
    await tester.pumpWidget(MyApp());
    final userNameFild = find.ancestor(
        of: find.text('Email'), matching: find.byType(TextFormField));
    await tester.enterText(userNameFild, 'modoranu');
    await tester.pumpAndSettle(const Duration(milliseconds: 300));
    final passwordFild = find.ancestor(
        of: find.text('Password'), matching: find.byType(TextFormField));
    await tester.enterText(userNameFild, 'Dm73b.7M5A8fENv');
    await tester.pumpAndSettle(const Duration(milliseconds: 300));
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(const Duration(seconds: 300));
  });
}
