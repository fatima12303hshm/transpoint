import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transpoint/src/ui/transaction/pages/send_transaction_page.dart';
import 'package:transpoint/src/ui/transaction/pages/transaction_history_page.dart';
import 'package:transpoint/src/ui/user/pages/profile_page.dart';
class MainPageController extends GetxController {
  int currentIndex = 0;
  final List<Widget> screens = [
    const SendTransactionPage(), 
    const TransactionHistoryPage(), 
    const ProfilePage()
  ];
}
