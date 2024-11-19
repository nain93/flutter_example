import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/web.dart';

Logger logger = Logger(
  printer: PrettyPrinter(),
);

String env(String key) {
  try {
    return dotenv.get(key);
  } on AssertionError catch (e) {
    if (e.message == 'A non-null fallback is required for missing entries') {
      logger.e(
        "'$key' Key does not exist. "
        "Make sure that the key exists in the '.env' file.",
      );
    }

    rethrow;
  }
}

class Config {
  factory Config() {
    return _singleton;
  }

  Config._internal();
  static final Config _singleton = Config._internal();

  String get nativeAppKey => env('NATIVE_APP_KEY');
  String get javascriptAppKey => env('JAVASCRIPT_APP_KEY');
  String get restApiKey => env('REST_API_KEY');
  String get baseUrl => env('BASE_URL');
}
