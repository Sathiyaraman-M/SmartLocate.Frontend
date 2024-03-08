import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:smart_locate/services/local_storage_service.dart';

class ClaimDataService {
  static Future<String> getStudentId() async {
    final userToken = await LocalStorage.getAuthToken();
    if (userToken != null) {
      final claims = JwtDecoder.decode(userToken);
      return claims['student_id'];
    } else {
      return Future.error("Token not found!");
    }
  }

  static Future<String> getStudentName() async {
    final userToken = await LocalStorage.getAuthToken();
    if (userToken != null) {
      final claims = JwtDecoder.decode(userToken);
      return claims['student_name'];
    } else {
      return Future.error("Token not found!");
    }
  }

  static Future<String> getStudentEmail() async {
    final userToken = await LocalStorage.getAuthToken();
    if (userToken != null) {
      final claims = JwtDecoder.decode(userToken);
      return claims['student_email'];
    } else {
      return Future.error("Token not found!");
    }
  }

  static Future<String> getStudentPhone() async {
    final userToken = await LocalStorage.getAuthToken();
    if (userToken != null) {
      final claims = JwtDecoder.decode(userToken);
      return claims['student_phone'];
    } else {
      return Future.error("Token not found!");
    }
  }
}