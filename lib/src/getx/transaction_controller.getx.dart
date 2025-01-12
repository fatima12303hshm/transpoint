import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:transpoint/src/data/model/transaction_history.dart';
import 'package:transpoint/src/data/repository/transaction_repository.dart';
import 'package:transpoint/src/ui/common/widgets/loading_overlay.dart';
import 'package:transpoint/src/ui/common/widgets/toast_messages.dart';

class TransactionController extends GetxController {
  TransactionRepository _transactionRepository;
  TransactionController(this._transactionRepository);

  TextEditingController balance = TextEditingController();
  String? endUserCode;
  TransactionHistory? history;
  bool loading = false;

  void fetchHistory() async {
    loading = true;
    update();
    history = await _transactionRepository.fetchHistory();
    loading = false;
    update();
  }

  void transferBalance() async {
    loading = true;
    LoadingOverlay.of(Get.context!).show();
    update();
    var res = await _transactionRepository.transferBalance(
        endUserCode!, int.tryParse(balance.text) ?? 1);
    balance.clear();
    LoadingOverlay.of(Get.context!).hide();
    loading = false;
    update();
    if (res) {
      ToastMessages.successToastMessage(
          'Success', 'points transferred successfully');
    } else {
      ToastMessages.errorToastMessage('Error', 'Failed to transfer points');
    }
  }

  Future<void> scanQR() async {
    try {
      String scannedCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff4400EC', 'Cancel', false, ScanMode.QR);
      if (scannedCode != '-1') {
        endUserCode = scannedCode;

        print('end user code $endUserCode');
      } else {
        print('User cancelled the scan.');
        endUserCode = null;
      }
    } on PlatformException catch (e) {
      print('PlatformException: $e');
      endUserCode = null;
    } catch (e) {
      print('Unknown error: $e');
      endUserCode = null;
    } finally {
      update();
    }
  }
}
