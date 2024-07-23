part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class ListenCounterEvent extends HomeEvent {
  final int count;
  final Duration duration;

  ListenCounterEvent({required this.count, required this.duration});
  @override
  List<Object?> get props => [
        count,
        duration,
      ];
}
