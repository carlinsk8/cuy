
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {

  Future<bool> setToken(String token);
  String getToken();
  Future<bool> clear();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const token = 'token';
  UserLocalDataSourceImpl({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  @override
  String getToken() {
    return sharedPreferences.getString(token) ?? '';
  }

  @override
  Future<bool> setToken(String newToken) {
    return sharedPreferences.setString(token, newToken);
  }


  @override
  Future<bool> clear() {
    return sharedPreferences.clear();
  }
}
