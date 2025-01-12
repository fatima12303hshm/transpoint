import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpoint/core/routes.dart';
import 'package:transpoint/core/shared_preferences_helper.dart';
import 'package:transpoint/src/data/model/user.dart';
import 'package:transpoint/src/data/repository/user_repo.dart';
import 'package:transpoint/src/ui/common/widgets/loading_overlay.dart';
import 'package:transpoint/src/ui/common/widgets/toast_messages.dart';

class UserController extends GetxController {
  UserRepository _repository;
  UserController(this._repository);
  TextEditingController userId = TextEditingController();
  bool loading = false;
  bool profileLoading = false;
  User? user;

  @override
  void onInit() {
    Future.delayed(
      25.milliseconds,
      () {
        SharedPreferencesHelper helper = SharedPreferencesHelper();
        helper.getInt('user_id').then((value) {
          if (value == null) {
            Get.toNamed(Routes.loginPage);
          } else {
            Get.toNamed(Routes.mainPage);
          }
        });
      },
    );

    super.onInit();
  }

  void login() async {
    if (userId.text.isEmpty) return;
    loading = true;
    LoadingOverlay.of(Get.context!).show();
    update();
    final result = await _repository.loginUser(int.parse(userId.text));
    userId.clear();
    loading = false;
    LoadingOverlay.of(Get.context!).hide();

    update();
    if (result != null) {
      SharedPreferencesHelper _helper = SharedPreferencesHelper();
      _helper.setInt('user_id', result.id);
      Get.offAndToNamed(Routes.mainPage);
    } else {
      ToastMessages.errorToastMessage('Failure', 'Invalid User Id');
    }
  }

  void generateQRCode() async {
    loading = true;
    LoadingOverlay.of(Get.context!).show();

    update();
    SharedPreferencesHelper _helper = SharedPreferencesHelper();
    var id = await _helper.getInt('user_id');
    var code = id.toString() + DateTime.now().toString();
    final result = await _repository.generateQRCode(code);

    loading = false;
    update();
    LoadingOverlay.of(Get.context!).hide();

    if (result) {
      user!.qrCode = code;
      update();
    } else {
      ToastMessages.errorToastMessage('Failure', 'Something went wrong');
    }
  }

  void getUserData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    profileLoading = true;
    update();
    user = await _repository.getUserData();
    profileLoading = false;
    update();
    if (user == null) {
      ToastMessages.errorToastMessage('Failure', 'Invalid User Id');
    }
  }

  void logout() {
    SharedPreferencesHelper _helper = SharedPreferencesHelper();
    _helper.remove('user_id');
    Get.offAndToNamed(Routes.loginPage);
  }
}
