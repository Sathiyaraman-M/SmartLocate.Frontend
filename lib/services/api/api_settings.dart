import 'package:smart_locate/services/local_storage_service.dart';

class ApiSettings {
  static const String baseUrl = "10.0.2.2:7000";

  static Future<Map<String, String>> getHeaders({bool addAuthToken = false}) async {
    final headers = {
      'Content-Type': 'application/json; x-api-version=1.0; charset=UTF-8',
    };
    if(addAuthToken == true) {
      final authToken = await LocalStorage.getAuthToken();
      if (authToken != null) {
        headers['Authorization'] = 'Bearer $authToken';
      }
    }
    return headers;
  }
}