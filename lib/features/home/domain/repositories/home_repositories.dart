import 'package:tdd_starter/core/models/data_state.dart';

abstract class HomeRepositories {
  Stream<DataState<int>> generateNumber(
      {required int count, required Duration duration});
}
