import 'package:flutter/material.dart';
import 'package:transpoint/resources/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String title;
  final Function onTap;
  final double? width;
  final double? height;
  final double radius;
  final double marginValue;
  final Color? textColor;
  const CustomButton(
      {super.key,
      required this.color,
      required this.title,
      required this.onTap,
      this.width = double.infinity,
      this.height = 57,
      this.radius = 20,
      this.marginValue = 3,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
            margin: EdgeInsets.all(marginValue),
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 5,
                      spreadRadius: 0,
                      color: AppColors.blackColorOpacity(15))
                ]),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: textColor ?? AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )));
  }
}
