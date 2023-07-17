import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multiplatform_login_screen/services/secure_storage_service.dart';

import '../exceptions/form_exception.dart';
import 'helper_service.dart';

class AuthService {
  static const String loginPath = '/api/v1/auth/login';

  static Future<void> login({
    required String login,
    required String password,
  }) async {
    final response = await http.post(
      HelperService.buildUri(loginPath),
      headers: HelperService.buildHeaders(),
      body: jsonEncode(
        {
          'login': login,
          'password': password,
        },
      ),
    );

    final statusType = (response.statusCode / 100).floor() * 100;
    switch (statusType) {
      case 200:
        final json = jsonDecode(response.body);
        saveToken(json['accessToken']);
      case 400:
        final json = jsonDecode(response.body);
        throw handleFormErrors(json);
      case 300:
      case 500:
      default:
        throw FormGeneralException(message: "Ошибка подключения к серверу!");
    }
  }

  static void saveToken(String accessToken) async {
    await SecureStorageService.storage.write(
      key: SecureStorageService.accessToken,
      value: accessToken,
    );
  }
}
