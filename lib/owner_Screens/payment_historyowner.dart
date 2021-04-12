import 'package:HomER_flutter/widgets/owner/owner_drawer.dart';
import 'package:HomER_flutter/widgets/tenet/transaction.dart';
import 'package:flutter/material.dart';
// enum TransactionType { sent, received, pending }
class PaymentHistoryOwner extends StatelessWidget {
  static const id = 'paymentHistoryOwner';
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_open,
            color: Colors.purple,
            size: 32,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Payment History',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.question_answer_rounded), onPressed: (){}),
        ],
      ),
      drawer: OwnerDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => Transaction(
          receptient: 'OWNER X',
          transactionAmount: '20',
          transactionDate: 'Feb',
          transactionInfo: 'xyz',
          transactionType: TransactionType.sent,
        ),
        itemCount: 4,
      ),
    );
  }
}
