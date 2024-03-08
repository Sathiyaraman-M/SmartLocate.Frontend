import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class StudentLoginRequest {
  String email;
  String password;

  StudentLoginRequest(
      {required this.email, required this.password});

  Map<String, dynamic> toJson() =>
      {'email': email, 'password': password};
}