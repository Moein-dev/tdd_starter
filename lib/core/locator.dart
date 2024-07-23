import 'package:get_it/get_it.dart';
import 'package:tdd_starter/features/home/data/datasources/home_api_provider.dart';
import 'package:tdd_starter/features/home/data/repositories/home_repositories_lmpl.dart';
import 'package:tdd_starter/features/home/domain/repositories/home_repositories.dart';
import 'package:tdd_starter/features/home/domain/usecases/generate_number_usecase.dart';
import 'package:tdd_starter/features/home/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  locator.registerSingleton<HomeApiProvider>(HomeApiProvider());

  locator.registerSingleton<HomeRepositories>(
      HomeRepositoriesImpl(apiProvider: locator()));

  locator.registerSingleton<GenerateNumberUsecase>(
      GenerateNumberUsecase(repositories: locator()));

  locator.registerSingleton<HomeBloc>(HomeBloc(
    generateNumberUsecase: locator(),
  ));
}
