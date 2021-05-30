import 'package:HomER_flutter/tenant_Screens/home.dart';
import 'package:HomER_flutter/tenant_Screens/payment_history.dart';
import '../../tenant_Screens/presentHome.dart';
import 'package:HomER_flutter/tenant_Screens/profile.dart';
import 'package:HomER_flutter/tenant_Screens/searchHome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool showmore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .68,
      child: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed(TenetProfile.id);
              },
              child: DrawerHeader(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: Text('Bala')),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushReplacementNamed(TenetHome.id);
            //     },
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.message,
            //           color: Colors.deepPurple,
            //         ),
            //         SizedBox(width: 10),
            //         Text(
            //           'Conversation',
            //           style: TextStyle(
            //             fontSize: 15,
            //             color: Colors.deepPurple,
            //             fontWeight: FontWeight.w700,
            //           ),
            //           textAlign: TextAlign.center,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Conversation',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(TenetHome.id);
              },
            ),
            SizedBox(
              height: 13,
            ),
             ListTile(
              leading: Icon(
                Icons.search,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Search Houses',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(SearchHousePage.id);
              },
            ),
            SizedBox(
              height: 13,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Present Home',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(PresentHome.id);
              },
            ),
            SizedBox(
              height: 13,
            ),
            ListTile(
              leading: Icon(
                Icons.payment,
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
                Navigator.of(context).pushReplacementNamed(PaymentHistory.id);
              },
            ),
            SizedBox(
              height: 13,
            ),
            ListTile(
              leading: Icon(
                Icons.car_rental,
                color: Colors.deepPurple,
              ),
              title: Text(
                'Transport facility',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(TenetProfile.id);
              },
            ),
            SizedBox(
              height: 13,
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
            ))
          ],
        ),
      ),
    );
  }
}
