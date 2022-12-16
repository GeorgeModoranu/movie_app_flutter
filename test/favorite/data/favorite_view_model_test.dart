import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/movie/presentation/widgets/movie_details_view_model.dart';

import '../../core/di.injection.dart';
import '../../utils/test_mobx.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  setUp(() async {
    await configureInjectionTestDependencies();
  });
  tearDown(() async {
    await getIt.reset();
  });
  test('add movie to favorite', () async {
    final viewModel = getIt<MovieDetailsViewModel>(param1: 436270);
    streamOf((_) => viewModel.isFavourite);

    await asyncValue((_) => viewModel.toggleFavourites());
    expect(viewModel.isFavourite, true);
  });
}
