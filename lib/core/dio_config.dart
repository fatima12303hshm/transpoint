import 'dart:async';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get/get.dart';
import 'package:transpoint/core/routes.dart';
import 'package:transpoint/core/shared_preferences_helper.dart';
import 'package:transpoint/resources/api_path.dart';

class Api {
  Dio api = Dio(
    BaseOptions(
      baseUrl: ApiUrl.baseUrl,
    ),
  );
  Api() {
    initialize();
  }
  void initialize() async {
    api.interceptors.add(RetryInterceptor(
      dio: api,
      logPrint: (message) {
        print(message);
      },
      retries: 1,
      retryEvaluator: (error, attempt) {
        print(error);
        return attempt < 1;
      },
      retryDelays: const [Duration(seconds: 3)],
    ));
    api.interceptors.add(
      LogInterceptor(
        logPrint: (object) {
          print(object);
        },
        error: true,
        request: false,
        requestBody: true,
        requestHeader: false,
        responseBody: true,
        responseHeader: false,
      ),
    );
    api.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        SharedPreferencesHelper _helper = SharedPreferencesHelper();
        int? userId = await _helper.getInt('user_id');
        options.baseUrl = ApiUrl.baseUrl;
        options.headers.addAll({
          'user_id': userId,
          "Content-Type": "application/json",
        });
        return handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          _handleUnauthorizedError();

          return handler.next(error);
        } else {
          return handler.next(error);
        }
      },
    ));
  }

  Future<void> _handleUnauthorizedError() async {
    SharedPreferencesHelper _helper = SharedPreferencesHelper();
    _helper.remove('user_id');
    Get.offAndToNamed(Routes.loginPage);
  }
}
