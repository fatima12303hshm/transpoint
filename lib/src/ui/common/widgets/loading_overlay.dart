import 'package:flutter/material.dart';
import 'package:transpoint/resources/app_colors.dart';

class LoadingOverlay {
  BuildContext context;
  void hide() {
    Navigator.of(context).pop();
  }

  void show() {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ));
  }

  LoadingOverlay._create(this.context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}
