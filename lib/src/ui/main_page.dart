import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpoint/resources/app_colors.dart';
import 'package:transpoint/src/getx/main_page_controller.getx.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (MainPageController mainController) {
      return Scaffold(
          body: mainController.screens[mainController.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainController.currentIndex,
            backgroundColor: Colors.white,
            fixedColor: AppColors.primaryColor,
            selectedFontSize: 10,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
            unselectedFontSize: 10,
            unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: AppColors.grey),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.home_filled,
                    color: mainController.currentIndex == 0
                        ? AppColors.primaryColor
                        : AppColors.grey,
                    size: 30,
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.history,
                    color: mainController.currentIndex == 1
                        ? AppColors.primaryColor
                        : AppColors.grey,
                    size: 30,
                  ),
                ),
                label: "History",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.person,
                    color: mainController.currentIndex == 2
                        ? AppColors.primaryColor
                        : AppColors.grey,
                    size: 30,
                  ),
                ),
                label: "Profile",
              ),
            ],
            onTap: (int index) {
              mainController.currentIndex = index;
              mainController.update();
            },
          ));
    });
  }
}
