import 'package:flutter/material.dart';
import 'package:transpoint/main.dart';
import 'package:transpoint/resources/api_path.dart';
import 'package:transpoint/src/data/interface/user_interface.dart';
import 'package:transpoint/src/data/model/user.dart';

class UserServiceManager implements UserInterface {
  @override
  Future<bool> generateQRCode(String code) async {
    try {
      final res = await dio.patch(ApiUrl.generateQRCode, data: {'code': code});
      return res.statusCode == 200;
    } catch (e) {
      debugPrint('Exception generate qr: $e');
      return false;
    }
  }

  @override
  Future<User?> getUserData() async {
    try {
      final res = await dio.get(ApiUrl.getUserData);
      if (res.statusCode == 200) {
        User user = User.fromJson(res.data['data']);
        return user;
      }
      return null;
    } catch (e) {
      debugPrint('Exception $e');
      return null;
    }
  }

  @override
  Future<User?> login(int id) async {
    try {
      final res = await dio.post(ApiUrl.login, data: {'id': id});
      if (res.statusCode == 200) {
        User user = User.fromJson(res.data['data']);
        return user;
      }
      return null;
    } catch (e) {
      debugPrint('Exception Login $e');
      return null;
    }
  }
}
