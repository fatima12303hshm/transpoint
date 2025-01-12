import 'package:get/get.dart';
import 'package:transpoint/src/data/repository/transaction_repository.dart';
import 'package:transpoint/src/data/repository/user_repo.dart';
import 'package:transpoint/src/data/service/transaction_service_manager.service.dart';
import 'package:transpoint/src/data/service/user_service_manager.service.dart'; 
import 'package:transpoint/src/getx/main_page_controller.getx.dart';
import 'package:transpoint/src/getx/transaction_controller.getx.dart';
import 'package:transpoint/src/getx/user_controller.getx.dart';

class DependencyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MainPageController());
    Get.put(UserController(UserRepository(UserServiceManager())));
    Get.put(TransactionController(TransactionRepository(TransactionServiceManager())));
  }
}
