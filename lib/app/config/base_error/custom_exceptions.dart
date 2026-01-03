import 'package:equatable/equatable.dart';

class ConnectionError with EquatableMixin implements Exception {
  final String message;

  ConnectionError([this.message = "No Internet Connection"]);

  @override
  List<Object?> get props => [message];
}

class ServerError with EquatableMixin implements Exception {
  final String? message;
  final String? statusMessage;
  ServerError({this.message, this.statusMessage});
  @override
  List<Object?> get props => [message, statusMessage];
}

class UnexpectedError with EquatableMixin implements Exception {
  @override
  List<Object?> get props => [];
}
