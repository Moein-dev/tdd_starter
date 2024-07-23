
import 'package:tdd_starter/core/models/data_state.dart';

class HomeApiProvider {
  Stream<DataState<int>> generateNumberStream(int count, Duration interval) async* {
  for (int i = 0; i < count; i++) {
    await Future.delayed(interval);
    yield DataSuccess(data: i);
  }
 }
}