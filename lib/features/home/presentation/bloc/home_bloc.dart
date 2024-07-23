import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_starter/core/models/error_model.dart';
import 'package:tdd_starter/core/models/state_status.dart';
import 'package:tdd_starter/core/services/status_handler.dart';
import 'package:tdd_starter/features/home/domain/usecases/generate_number_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GenerateNumberUsecase generateNumberUsecase;
  HomeBloc({
    required this.generateNumberUsecase,
  }) : super(HomeState(
          counterStatus: StateInitial(),
        )) {
    on<ListenCounterEvent>((event, emit) async {
      emit(state.copyWith(newCounterStatus: const StateLoading()));
      await emit.onEach(
        generateNumberUsecase(
          count:event.count,
          duration:event.duration,
        ),
        onData: (data) {
          emit(
            state.copyWith(
              newCounterStatus: StatusHandler.getStatus(data),
            ),
          );
        },
        onError: (error, stackTrace) {
          state.copyWith(
              newCounterStatus: StateError(
            message: ErrorModel(
              status: "Failed",
              message: error.toString(),
            ),
          ));
        },
      );
    }, transformer: sequential());
  }
}
