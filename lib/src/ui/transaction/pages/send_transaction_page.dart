import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transpoint/src/getx/transaction_controller.getx.dart';
import 'package:transpoint/src/ui/common/widgets/custom_button.dart';
import 'package:transpoint/src/ui/common/widgets/input_field_widget.dart';
import 'package:transpoint/resources/app_colors.dart';

class SendTransactionPage extends StatefulWidget {
  const SendTransactionPage({super.key});

  @override
  State<SendTransactionPage> createState() => _SendTransactionPageState();
}

class _SendTransactionPageState extends State<SendTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Send Transaction',
        ),
      ),
      body: GetBuilder<TransactionController>(builder: (ctr) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                50.verticalSpace,
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
                    onPressed: () async {
                      await ctr.scanQR();
                    },
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      size: 60,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                15.verticalSpace,
                Text(
                  ctr.endUserCode == null ? "Scan QR Code" : "QR Scanned",
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                40.verticalSpace,
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Amount",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      10.verticalSpace,
                      CustomTextField(
                        controller: ctr.balance,
                        type: TextInputType.number,
                        action: TextInputAction.done,
                        hintText: "Enter the amount to send",
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: CustomButton(
                          color: AppColors.primaryColor,
                          title: "Send Transaction",
                          onTap: () {
                            ctr.transferBalance();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
