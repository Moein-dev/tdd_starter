import 'package:flutter/material.dart';
import 'package:tdd_starter/core/models/error_model.dart';

@immutable
abstract class StateStatus<T> {
  final int? itemId;
  final T? data;
  final ErrorModel? message;

  const StateStatus({
    this.itemId,
    this.data,
    this.message,
  });
}

class StateLoading<T> extends StateStatus<T> {
  const StateLoading({super.itemId});
}

class StateCompleted<T> extends StateStatus<T> {
  const StateCompleted({required super.data});
}

class StateLoadMore<T> extends StateStatus<T> {
  const StateLoadMore({super.data});
}

class StateNoData<T> extends StateCompleted<T> {
  const StateNoData({required super.data});
}

class StateInitial<T> extends StateStatus<T> {}

class StateError<T> extends StateStatus<T> {
  const StateError({required super.message});
}
