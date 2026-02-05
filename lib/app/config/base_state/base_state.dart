import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BaseState<T> extends Equatable {
  bool? isLoading;
  Exception? error;
  T? success;

  BaseState({this.isLoading = false, this.error, this.success});

  @override
  List<Object?> get props => [isLoading, success, error];
}
