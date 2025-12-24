

class ConnectionError implements Exception {
  String message;

  ConnectionError([this.message = "No Internet Connection"]);
}

class ServerError implements Exception {
  String? message;
  String? statusMessage;

  ServerError({this.message, this.statusMessage});
}

class UnexpectedError implements Exception {
  @override
  List<Object?> get props => [];
}
