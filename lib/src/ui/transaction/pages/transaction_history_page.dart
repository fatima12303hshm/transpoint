import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:transpoint/src/getx/transaction_controller.getx.dart'; 
import 'package:transpoint/src/ui/transaction/widgets/transaction_widget.dart';
import 'package:transpoint/resources/app_colors.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    TransactionController controller = Get.find<TransactionController>();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() => setState(() {}));
    controller.fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Transaction History',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: GetBuilder<TransactionController>(builder: (ctr) {
        if (ctr.loading) {
          return const Center(
            child:  CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        }
        return Column(
          children: [
            20.verticalSpace,
            TabBar(
              indicatorColor: AppColors.primaryColor,
              controller: _tabController,
              tabs: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('Sent',
                      style: TextStyle(
                          fontSize: 14,
                          color: _tabController.index == 0
                              ? AppColors.primaryColor
                              : AppColors.grey)),
                ),
                Container(
                  width: Get.width * 0.5,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    'Received',
                    style: TextStyle(
                        fontSize: 14,
                        color: _tabController.index == 1
                            ? AppColors.primaryColor
                            : AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                ListView.builder(
                    itemCount: ctr.history!.sent.length,
                    itemBuilder: (context, index) {
                      return TransactionWidget(
                        name: ctr.history!.sent[index].name,
                        amount: ctr.history!.sent[index].amount,
                        createdAt:
                            ctr.history!.sent[index].createdAt.split('T').first,
                        isSender: true,
                      );
                    }),
                ListView.builder(
                    itemCount: ctr.history!.received.length,
                    itemBuilder: (context, index) {
                      return TransactionWidget(
                        name: ctr.history!.received[index].name,
                        amount: ctr.history!.received[index].amount,
                        createdAt: ctr.history!.received[index].createdAt
                            .split('T')
                            .first,
                        isSender: false,
                      );
                    })
              ]),
            )
          ],
        );
      }),
    );
  }
}
