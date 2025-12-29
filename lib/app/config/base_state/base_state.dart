import 'package:equatable/equatable.dart';

class BaseState<T> extends Equatable {
  bool? isLoading;
  T? success;
  Exception? error;

  BaseState({this.isLoading, this.success, this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [isLoading, success, error];
}
