import 'package:tdd_starter/core/models/data_state.dart';
import 'package:tdd_starter/features/home/domain/repositories/home_repositories.dart';

class GenerateNumberUsecase {
  final HomeRepositories repositories;

  GenerateNumberUsecase({required this.repositories});

  Stream<DataState<int>> call(
      {required int count, required Duration duration}) async* {
    yield* repositories.generateNumber(count: count, duration: duration);
  }
}
