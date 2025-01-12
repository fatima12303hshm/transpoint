import 'package:flutter/material.dart';
import 'package:transpoint/resources/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final TextInputType type;
  final TextInputAction action;
  final Widget? suffixIcon;
  final double marginValue;
  final String? Function(String?)? validator;

  const CustomTextField(
      {super.key,
      this.hintText,
      this.labelText,
      this.validator,
      required this.controller,
      required this.type,
      required this.action,
      this.marginValue = 2,
      this.suffixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(horizontal: widget.marginValue),
      width: double.infinity,
      child: TextFormField(
        keyboardType: widget.type,
        textInputAction: widget.action,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.titleSmall,
          labelText: widget.labelText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColors.errorColor)),
          filled: true,
          fillColor: AppColors.greyColorOpacity(20),
        ),
      ),
    );
  }
}
