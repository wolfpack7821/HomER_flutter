import 'package:HomER_flutter/owner_Screens/adding_building.dart';
import 'package:HomER_flutter/owner_Screens/owner_chat.dart';
import 'package:HomER_flutter/owner_Screens/payment_historyowner.dart';
import 'package:HomER_flutter/tenant_Screens/complaintPage.dart';
import 'package:HomER_flutter/tenant_Screens/presentHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './owner_Screens/houses_overview_screen.dart';
import './providers/buildings_provider.dart';
import './login/loginscreen.dart';
import './login/welcome.dart';
import './owner_Screens/buildings_overview_screen.dart';
import './tenant_Screens/home.dart';
import './tenant_Screens/payment_details.dart';
import './tenant_Screens/payment_history.dart';
import './tenant_Screens/profile.dart';
import './owner_Screens/edit_house_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BuildingsProvider>(
          create:(BuildContext context)=> BuildingsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'HomER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: WelcomePage(),
        routes: {
          LoginPage.id: (context) => LoginPage(),
          TenetHome.id: (context) => TenetHome(),
          TenetProfile.id: (context) => TenetProfile(),
          HousesOverviewScreen.id: (_) => HousesOverviewScreen(),
          BuildingsOverviewScreen.id:(context) => BuildingsOverviewScreen(),
          PaymentHistory.id: (context) => PaymentHistory(),
          PaymentHistoryOwner.id:(context) => PaymentHistoryOwner(),
          PaymentDetails.id:(context) =>PaymentDetails(),
          ComplaintPage.id: (context) => ComplaintPage(),
          AddHouse.id:(_) => AddHouse(),
          OwnerChat.id:(_) =>OwnerChat(),
          PresentHome.id:(_) => PresentHome(),
          AddingBuilding.id:(_) =>AddingBuilding(),
        },
      ),
    );
  }
}
