import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:transpoint/resources/app_colors.dart';

class ToastMessages {
  static void errorToastMessage(String title, String description) {
    toastification.show(
        applyBlurEffect: true,
        style: ToastificationStyle.flat,
        showProgressBar: true,
        icon: const Icon(
          Icons.cancel,
          color: AppColors.errorColor,
        ),
        progressBarTheme:
            const ProgressIndicatorThemeData(color: AppColors.errorColor),
        type: ToastificationType.error,
        animationDuration: const Duration(seconds: 1),
        autoCloseDuration: const Duration(seconds: 4),
        title: Text(
          title,
          style: const TextStyle(
              color: AppColors.errorColor, fontWeight: FontWeight.bold),
        ),
        showIcon: true,
        description: Text(
          description,
          style: const TextStyle(
              color: AppColors.errorColor, fontWeight: FontWeight.w400),
        ));
  }

  static void successToastMessage(String title, String description) {
    toastification.show(
        applyBlurEffect: true,
        style: ToastificationStyle.flat,
        showProgressBar: true,
        progressBarTheme:
            const ProgressIndicatorThemeData(color: AppColors.successColor),
        primaryColor: AppColors.successColor,
        type: ToastificationType.success,
        animationDuration: const Duration(seconds: 1),
        autoCloseDuration: const Duration(seconds: 4),
        title: Text(
          title,
          style: const TextStyle(
              color: AppColors.successColor, fontWeight: FontWeight.bold),
        ),
        showIcon: true,
        description: Text(
          description,
          style: const TextStyle(
              color: AppColors.successColor, fontWeight: FontWeight.w400),
        ));
  }
}
