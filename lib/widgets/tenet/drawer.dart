import 'package:HomER_flutter/tenant_Screens/home.dart';
import 'package:HomER_flutter/tenant_Screens/profile.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool showmore = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          DrawerHeader(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.message,
              color: Colors.deepOrange,
            ),
            title: Text(
              'Conversation',
              style: TextStyle(
                fontSize: 15,
                color: Colors.deepOrange,
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
              Icons.home,
              color: Colors.deepOrange,
            ),
            title: Text(
              'Present Home',
              style: TextStyle(
                fontSize: 15,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              // Navigator.of(context).pushReplacementNamed(TenetHome.id);
            },
          ),
          SizedBox(
            height: 13,
          ),
          ListTile(
            leading: Icon(
              Icons.payment,
              color: Colors.deepOrange,
            ),
            title: Text(
              'Payment History',
              style: TextStyle(
                fontSize: 15,
                color: Colors.deepOrange,
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
              Icons.account_circle,
              color: Colors.deepOrange,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 15,
                color: Colors.deepOrange,
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
              color: Colors.deepOrange,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 15,
                color: Colors.deepOrange,
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
          ))
        ],
      ),
    );
  }
}
