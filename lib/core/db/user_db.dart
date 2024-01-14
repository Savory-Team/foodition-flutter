import '../../../../core/db/db_service.dart';

class UserDB {
  final SharedPreferencesService _service;
  UserDB(this._service);

  Future<void> saveToken(String token) async {
    await _service.saveToken(token);
  }

  Future<String> loadToken() async {
    return await _service.loadToken() ?? '';
  }

  Future<void> removeToken() async {
    await _service.removeToken();
  }
}
