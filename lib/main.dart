import 'package:HomER_flutter/login/loginscreen.dart';
import 'package:HomER_flutter/login/welcome.dart';
import 'package:HomER_flutter/tenant_Screens/home.dart';
import 'package:HomER_flutter/tenant_Screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './owner_Screens/buildings_overview_screen.dart';
import './owner_Screens/houses_overview_screen.dart';
import './providers/buildings_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => BuildingsProvider(),
      child: MaterialApp(
        title: 'HomER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: WelcomePage(),
        routes: {
        LoginPage.id:(context)=>LoginPage(),
        TenetHome.id:(context)=>TenetHome(),
        TenetProfile.id:(context)=>TenetProfile(),
        HousesOverviewScreen.routeName: (_) => HousesOverviewScreen(),
        },
      ),
    );
  }
}

