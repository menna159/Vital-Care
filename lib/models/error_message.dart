class ErrorMessage {
  String? message;

  ErrorMessage({this.message});
  factory ErrorMessage.fromjson(Map<String, dynamic> jsonData) {
    return ErrorMessage(
      message: jsonData['message'],
    );
  }
}
