import 'package:transpoint/src/data/model/user.dart';

abstract interface class UserInterface {
  Future<User?> login(int id);
  Future<bool> generateQRCode(String code);
  Future<User?> getUserData();

}