import 'package:HomER_flutter/owner_Screens/houses_overview_screen.dart';
import 'package:HomER_flutter/owner_Screens/payment_historyowner.dart';
import 'package:flutter/material.dart';

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
                Navigator.of(context)
                    .pushReplacementNamed(HousesOverviewScreen.id);
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
                Navigator.of(context)
                    .pushReplacementNamed(PaymentHistoryOwner.id);
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
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/');
                // Provider.of<Auth>(context, listen: false).logout();
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
