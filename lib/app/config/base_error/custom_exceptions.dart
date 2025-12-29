import 'package:equatable/equatable.dart';

class ConnectionError with EquatableMixin implements Exception {
  String message;

  ConnectionError([this.message = "No Internet Connection"]);

  @override
  List<Object?> get props => [];
}

class ServerError with EquatableMixin implements Exception {
  String? message;
  String? statusMessage;
  ServerError({this.message, this.statusMessage});
  @override
  List<Object?> get props => [];
}

class UnexpectedError with EquatableMixin implements Exception {
  @override
  List<Object?> get props => [];
}
