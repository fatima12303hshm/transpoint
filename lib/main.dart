import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'package:transpoint/core/bindings.dart';
import 'package:transpoint/core/dio_config.dart';
import 'package:transpoint/core/routes.dart'; 
import 'package:transpoint/resources/app_colors.dart';
import 'package:transpoint/src/ui/user/pages/login_page.dart';

void main() {
  runApp( MyApp(Routes()));
}

final dio = Api().api;

class MyApp extends StatelessWidget {

  final Routes routes;
  const MyApp(this.routes,{super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      child: ToastificationWrapper(
        child: GetMaterialApp(
          routes: routes.routes,
            initialBinding: DependencyBindings(),
            title: 'TransPoint',
            theme: ThemeData(
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.shifting,
                    selectedItemColor: AppColors.primaryColor,
                    unselectedItemColor: AppColors.grey,
                    backgroundColor: AppColors.white),
                primaryColor: AppColors.white,
                splashColor: AppColors.white,
              
                appBarTheme: const AppBarTheme(
                  
                  color: Colors.white,
                  centerTitle: true,
                  scrolledUnderElevation: 0,
                  surfaceTintColor: Colors.white,
                  
                  titleTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                scaffoldBackgroundColor: AppColors.white),
            home: const LoginPage()),
      ),
    );
  }
}
