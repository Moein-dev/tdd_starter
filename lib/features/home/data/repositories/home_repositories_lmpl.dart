import 'package:tdd_starter/core/models/data_state.dart';
import 'package:tdd_starter/core/models/error_model.dart';
import 'package:tdd_starter/features/home/data/datasources/home_api_provider.dart';
import 'package:tdd_starter/features/home/domain/repositories/home_repositories.dart';

class HomeRepositoriesImpl extends HomeRepositories {
  final HomeApiProvider apiProvider;

  HomeRepositoriesImpl({required this.apiProvider});

  @override
  Stream<DataState<int>> generateNumber(
      {required int count, required Duration duration}) async* {
    try {
      var data = apiProvider.generateNumberStream(
        count,
        duration,
      );
      yield* data;
    } catch (e) {
      yield DataFailed(error: ErrorModel(status: "Failed", message:"can't generate numbers"));
    }
  }
}
