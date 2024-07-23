import 'package:flutter/material.dart';
import 'package:tdd_starter/core/models/data_state.dart';
import 'package:tdd_starter/core/models/error_model.dart';
import 'package:tdd_starter/core/models/state_status.dart';

class StatusHandler {
  static StateStatus<T> getStatus<T>(
    DataState<T> dataState, {
    Function(T? data)? onSuccess,
    Function(ErrorModel data)? onError,
  }) {
    if (dataState is DataSuccess) {
      if (onSuccess != null) {
        onSuccess(dataState.data);
      }
      return StateCompleted<T>(data: dataState.data as T);
    } else {
      if (onError != null) {
        onError(dataState.error!);
      }
      return StateError<T>(message: dataState.error!);
    }
  }

  static void of<T>(
    StateStatus<T> status, {
    void Function(T? data)? onResolve,
    void Function(ErrorModel error)? onError,
    VoidCallback? onLoading,
    VoidCallback? onInitial,
    VoidCallback? onCompleted,
  }) {
    if (status is StateCompleted && onResolve != null) {
      onResolve(status.data);
    }
    if (status is StateError && onError != null) {
      onError(status.message!);
    }
    if (status is StateLoading && onLoading != null) {
      onLoading();
    }
    if (status is StateInitial && onInitial != null) {
      onInitial();
    }
    if ((status is StateCompleted || status is StateError) &&
        onCompleted != null) {
      onCompleted();
    }
  }
}
