import 'package:HomER_flutter/widgets/tenet/drawer.dart';
import 'package:HomER_flutter/widgets/tenet/paymentTile.dart';
import 'package:flutter/material.dart';

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
              icon: Icon(Icons.question_answer_rounded), onPressed: (){}),
        ],
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, i) => PaymentTile(
          amount: 40,
          paidTo: 'Bala',
          payId: '01',
          date: 'Feburary 1',
          paymentResult: false,
        ),
        itemCount: 4,
      ),
    );
  }
}
