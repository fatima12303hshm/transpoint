import 'package:transpoint/src/data/model/transaction_history.dart';
import 'package:transpoint/src/data/service/transaction_service_manager.service.dart';

class TransactionRepository {
  TransactionServiceManager _manager;
  TransactionRepository(this._manager);

  Future<bool> transferBalance(String code, int? amount) async =>
      _manager.transferBalance(code, amount);
  Future<TransactionHistory> fetchHistory() async => _manager.fetchHistory();
}
