import 'package:HomER_flutter/tenant_Screens/payment_details.dart';
import 'package:HomER_flutter/widgets/tenet/drawer.dart';
import 'package:HomER_flutter/widgets/tenet/transaction.dart';
import 'package:flutter/material.dart';

// enum TransactionType { sent, received, pending }
class PaymentHistory extends StatelessWidget {
  static const id = 'paymentHistory';
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
        // centerTitle: true,
        title: Text(
          'Payment History',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.question_answer_rounded), onPressed: () {}),
        ],
      ),
      drawer: MainDrawer(),
      body: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(PaymentDetails.id);
        },
        child: ListView.builder(
          itemBuilder: (ctx, i) => Transaction(
            receptient: 'OWNER X',
            transactionAmount: '20',
            transactionDate: 'Feb',
            transactionInfo: 'xyz',
            transactionType: TransactionType.sent,
          ),
          itemCount: 4,
        ),
      ),
    );
  }
}
