import 'package:transpoint/main.dart';
import 'package:transpoint/resources/api_path.dart';
import 'package:transpoint/src/data/interface/transaction_interface.dart';
import 'package:transpoint/src/data/model/transaction_history.dart';

class TransactionServiceManager implements TransactionInterface {
  @override
  Future<TransactionHistory> fetchHistory() async {
    try {
      final res = await dio.get(ApiUrl.getTransactions);
      if (res.statusCode == 200) {
        print(res.data['data']);
        TransactionHistory transactionHistory =
            TransactionHistory.fromJson(res.data['data']);
        return transactionHistory;
      }
      return TransactionHistory(sent: [], received: []);
    } catch (e) {
      return TransactionHistory(sent: [], received: []);
    }
  }

  @override
  Future<bool> transferBalance(String code, int? amount) async {
    try {
      final res = await dio
          .post(ApiUrl.transferBalance, data: {'code': code, 'amount': amount});
      return res.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
