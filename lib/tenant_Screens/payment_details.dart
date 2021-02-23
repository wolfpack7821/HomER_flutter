import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  static const id = 'pay-details';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(backgroundColor: Colors.grey,elevation: 0,),
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                height: MediaQuery.of(context).size.height * .4,
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * .6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
