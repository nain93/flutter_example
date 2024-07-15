import 'package:flutter_example/utils/config.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ITokenRepository {
  Future<void> setToken({required String token});
  Future<void> removeToken();
  Future<Object?> getToken();
}

class TokenRepository implements ITokenRepository {
  const TokenRepository._();
  static TokenRepository instance = const TokenRepository._();

  static const storage = FlutterSecureStorage();
  static const String key = 'SecuredAuthToken';

  @override
  Future<void> setToken({required String token}) async {
    try {
      await storage.write(key: key, value: token);
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      await storage.delete(key: key);
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      var token = await storage.read(key: key);
      return token;

      // todo refresh token 구현
    } catch (e) {
      logger.d(e);
    }
    return null;
  }
}
