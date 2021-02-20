import 'package:HomER_flutter/login/loginscreen.dart';
import 'package:HomER_flutter/login/welcome.dart';
import 'package:HomER_flutter/tenant_Screens/home.dart';
import 'package:HomER_flutter/tenant_Screens/profile.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomER',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: WelcomePage(),
      routes: {
        LoginPage.id:(context)=>LoginPage(),
        TenetHome.id:(context)=>TenetHome(),
        TenetProfile.id:(context)=>TenetProfile()
      },
    );
  }
}

