import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tdd_starter/core/models/error_model.dart';
import 'package:tdd_starter/core/models/state_status.dart';

class StateStatusLayout<T> extends StatelessWidget {
  final StateStatus<T> status;
  final Widget Function(ErrorModel error) onErrorStatus;
  final void Function(ErrorModel error)? onErrorListener;
  final Widget Function(BuildContext context, T? data) onCompletedStatus;
  final Widget onInitialStatus;
  final Widget onLoadingStatus;
  const StateStatusLayout({
    super.key,
    required this.status,
    required this.onCompletedStatus,
    required this.onErrorStatus,
    required this.onInitialStatus,
    required this.onLoadingStatus,
    this.onErrorListener,
  });

  @override
  Widget build(BuildContext context) {
    if (status is StateError) {
      if (onErrorListener != null) {
        onErrorListener!(status.message!);
      }
    }
    if (status is StateCompleted || status is StateNoData) {
      return StreamBuilder(
        stream: Stream.value(status),
        builder: (context, snapshot) {
          log(status.data!.toString());
          return onCompletedStatus(context, status.data);
        },
      );
    }
    if (status is StateError) {
      return onErrorStatus(status.message!);
    }
    if (status is StateInitial) {
      return onInitialStatus;
    }
    if (status is StateLoading) {
      return onLoadingStatus;
    }
    return Container();
  }
}
