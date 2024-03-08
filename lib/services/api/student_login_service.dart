import 'dart:convert';
import 'dart:io';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:smart_locate/models/auth/login_response.dart';
import 'package:smart_locate/models/auth/student_login_request.dart';
import 'package:http/http.dart' as http_client;
import 'package:smart_locate/services/api/api_settings.dart';
import 'package:smart_locate/services/local_storage_service.dart';

class StudentLoginService {
  static Future<bool> loginAsync(StudentLoginRequest loginRequest) async {
    try {
      final response = await http_client.post(
          Uri.http(ApiSettings.baseUrl, "/identity/students/login"),
          body: jsonEncode(loginRequest),
          headers: await ApiSettings.getHeaders(addAuthToken: false));
      if (response.statusCode == 200) {
        final obj = JsonMapper.deserialize<LoginResponse>(response.body);
        if(obj == null) {
          throw const FormatException();
        }
        LocalStorage.setAuthToken(obj.token);
        LocalStorage.setRefreshToken(obj.refreshToken);
        return true;
      }
      return false;
    } on SocketException {
      return Future.error("No Internet Connection!");
    } on FormatException {
      return Future.error("Bad Response Format!");
    } on Exception {
      return Future.error("Unexpected Error!");
    }
  }
}