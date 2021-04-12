import 'package:flutter/material.dart';

class PaymentDetails extends StatelessWidget {
  static const id = 'pay-details';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.grey[200],
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              color: Colors.grey[200],
              height: 300,
              child: Column(
                children: [],
              ),
            ),
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,2,10,5),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width*.9,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        child: Container(),
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
