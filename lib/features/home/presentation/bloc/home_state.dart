part of 'home_bloc.dart';

class HomeState extends Equatable {
  final StateStatus<int> counterStatus;
  const HomeState({
    required this.counterStatus,
  });

  @override
  List<Object> get props => [
        counterStatus,
      ];

  HomeState copyWith({StateStatus<int>? newCounterStatus}) {
    return HomeState(
      counterStatus: newCounterStatus ?? counterStatus,
    );
  }
}