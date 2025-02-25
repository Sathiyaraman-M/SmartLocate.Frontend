import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class LoginResponse {
  String token = '';
  String refreshToken = '';
  DateTime expiresAt = DateTime.now();
}