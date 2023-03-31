import 'dart:convert';

import '../../../../../core/api/public_http_client.dart';
import '../../../../../core/models/response_model.dart';
import '../local/user_local_data_source.dart';

abstract class AuthDataSource {
  Future<bool> login(String email, String password);
}

class AuthDataSourceImpl extends AuthDataSource {
  AuthDataSourceImpl({
    required this.publicHttpClient,
    required this.userLocalDataSource, 
  });

  final PublicHttpClient publicHttpClient;
  final UserLocalDataSource userLocalDataSource;

  String get baseApiUrl => 'https://apidev.cuy.pe/api/v1';
  
  @override
  Future<bool> login(String email, String password) async {
    var payload = json.encode({
      'email': email,
      'password': password
    });

    final response = await publicHttpClient.post('$baseApiUrl/auth',
        body: payload);

    final body = ResponseModel.fromJson(response.data);

    userLocalDataSource.setToken(body.oauthToken);

    return body.status=='success';
  }

}