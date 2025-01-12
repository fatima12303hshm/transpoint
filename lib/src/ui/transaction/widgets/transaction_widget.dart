import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transpoint/resources/app_colors.dart';

class TransactionWidget extends StatelessWidget {
  final String name;
  final int amount;
  final String createdAt;
  final bool isSender;
  const TransactionWidget(
      {super.key,
      required this.name,
      required this.amount,
      required this.createdAt,
      this.isSender = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.greyColorOpacity(35),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 6,
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.05)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 20,
              ),
              10.horizontalSpace,
              Text(
                isSender ? 'Receiver Name: $name' : 'Sender Name: $name',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.av_timer,
                size: 20,
              ),
              10.horizontalSpace,
              Text(
                isSender ? 'Sent At: $createdAt ' : 'Received At: $createdAt',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.monetization_on_rounded,
                size: 20,
              ),
              10.horizontalSpace,
              Text(
                'Amount: $amount',
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
