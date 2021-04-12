import 'package:HomER_flutter/tenant_Screens/payment_details.dart';
import 'package:flutter/material.dart';

class PaymentTile extends StatelessWidget {
  final int amount;
  final paidTo;
  final date;
  final payId;
  final bool paymentResult;

  PaymentTile(
      {@required this.amount,
      @required this.paidTo,
      @required this.payId,
      @required this.date,
      @required this.paymentResult});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7, right: 7, top: 1, bottom: 1),
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .1,
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
          ),
          title: Row(
            children: [Text(paidTo)],
          ),
          subtitle: Text('₹$amount'),
          onTap: () {
            print(payId);
            Navigator.of(context).pushNamed(PaymentDetails.id);
          },
          trailing: paymentResult
              ? Text(
                  'Success',
                  style: TextStyle(color: Colors.green),
                )
              : Text(
                  'Failed',
                  style: TextStyle(color: Colors.red),
                ),
        ),
      ),
    );
  }
}
