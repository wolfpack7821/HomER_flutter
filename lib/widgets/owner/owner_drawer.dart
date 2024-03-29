import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../owner_Screens/buildings_overview_screen.dart';
import '../../owner_Screens/payment_historyowner.dart';
class OwnerDrawer extends StatefulWidget {
  @override
  _OwnerDrawerState createState() => _OwnerDrawerState();
}

class _OwnerDrawerState extends State<OwnerDrawer> {
  bool showmore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .68,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: DrawerHeader(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: Text('Owner')),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Owner Home',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(BuildingsOverviewScreen.id);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Payment History',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(PaymentHistoryOwner.id);
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
            SizedBox(
              height: 13,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'v1.0.1',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
