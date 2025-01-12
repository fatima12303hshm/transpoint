import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:transpoint/resources/app_colors.dart';
import 'package:transpoint/src/getx/user_controller.getx.dart';
import 'package:transpoint/src/ui/common/widgets/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    UserController userController = Get.find<UserController>();
    userController.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
      ),
      body: GetBuilder<UserController>(builder: (ctr) {
        if (ctr.profileLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (ctr.user == null) {
          return 1.verticalSpace;
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              100.verticalSpace,
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.primaryColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.account_balance_outlined,
                      color: AppColors.primaryColor,
                    ),
                    10.horizontalSpace,
                    Text(
                      ctr.user?.balance.toString() ?? '',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              40.verticalSpace,
              ctr.user?.qrCode == null
                  ? Column(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            ctr.generateQRCode();
                          },
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 60,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      15.verticalSpace,
                      const Text(
                        "Generate Your QR Code",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ])
                  : Column(
                      children: [
                        QrImageView(
                          data: ctr.user!.qrCode!,
                          version: QrVersions.auto,
                          size: 200,
                        ),
                        10.verticalSpace,
                        TextButton(
                            onPressed: () {
                              ctr.generateQRCode();
                            },
                            child: const Text(
                              'Regenerate QR Code',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryColor),
                            )),
                      ],
                    ),
              Spacer(),
              CustomButton(
                  marginValue: 16,
                  color: AppColors.errorColor,
                  title: 'Log out',
                  onTap: () {
                    ctr.logout();
                  }),
              30.verticalSpace,
            ],
          ),
        );
      }),
    );
  }
}
