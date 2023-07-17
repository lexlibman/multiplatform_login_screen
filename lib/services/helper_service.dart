class HelperService {
  static const String host = "158.160.14.209";

  static const String scheme = "http";

  static Uri buildUri(String path) {
    return Uri(
      scheme: scheme,
      host: host,
      path: path,
    );
  }

  static Map<String, String> buildHeaders({String? accessToken}) {
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }
}
