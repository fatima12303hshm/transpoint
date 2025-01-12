import 'package:transpoint/src/data/model/transaction_history.dart';

abstract interface class TransactionInterface {
  Future<TransactionHistory> fetchHistory();
  Future<bool> transferBalance(String code, int? amount);
}