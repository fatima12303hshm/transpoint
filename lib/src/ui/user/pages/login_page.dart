import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transpoint/src/getx/user_controller.getx.dart';
import 'package:transpoint/src/ui/common/widgets/custom_button.dart';
import 'package:transpoint/src/ui/common/widgets/input_field_widget.dart';
import 'package:transpoint/resources/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child:     GetBuilder<UserController>(
                  builder: (usercontroller) {
                    
                    return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                100.verticalSpace,
                CustomTextField(
                  controller: usercontroller.userId,
                  type: TextInputType.number,
                  action: TextInputAction.done,
                  hintText: 'ID',
                  labelText: 'ID',
                ),
                100.verticalSpace,
            CustomButton(
                        color: AppColors.primaryColor, title: 'Login', onTap: () {usercontroller.login();})
                  
              ],
            )
          );
        })
        ),
      ),
    );
  }
}
