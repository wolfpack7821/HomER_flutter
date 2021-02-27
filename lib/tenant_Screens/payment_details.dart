import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  static const id = 'pay-details';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              backgroundColor: Colors.grey,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Bala'),
                background: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      Text('₹30'),
                      Text('Paid to:Bala'),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    child: Text('Paid to upi Id ',
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Paid from upi id X',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 800,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//  Container(
//           color: Colors.grey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                  Column(
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                         ),
//                         Text('₹30'),
//                         Text('Paid to:Bala'),
//                       ],
//                   ),
//                 Container(
//                   color: Colors.white,
//                   height: MediaQuery.of(context).size.height * .6,
//                 ),
//               ],
//             ),
//           ),
//         ),
