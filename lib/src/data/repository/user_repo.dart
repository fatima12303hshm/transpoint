import 'package:transpoint/src/data/model/user.dart';
import 'package:transpoint/src/data/service/user_service_manager.service.dart';

class UserRepository {
  UserServiceManager _manager;
  UserRepository(this._manager);

  Future<User?> getUserData() async => _manager.getUserData();
  Future<User?> loginUser(int id) async => _manager.login(id);
  Future<bool> generateQRCode(String code) async =>
      _manager.generateQRCode(code);
}
