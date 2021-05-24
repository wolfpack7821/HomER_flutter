
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './models/house.dart';
import './owner_Screens/adding_building.dart';
import './owner_Screens/houseDetails.dart';
import './owner_Screens/image_preview.dart';
import './owner_Screens/manageTenet.dart';
import './owner_Screens/owner_chat.dart';
import './owner_Screens/payment_historyowner.dart';
import './owner_Screens/uploadFiles.dart';
import './tenant_Screens/complaintPage.dart';
import './tenant_Screens/presentHome.dart';
import './tenant_Screens/searchHome.dart';
import './owner_Screens/houses_overview_screen.dart';
import './models/building.dart';
import './login/loginscreen.dart';
import './login/welcome.dart';
import './owner_Screens/buildings_overview_screen.dart';
import './tenant_Screens/home.dart';
import './tenant_Screens/payment_details.dart';
import './tenant_Screens/payment_history.dart';
import './tenant_Screens/profile.dart';
import './owner_Screens/edit_house_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Buildings>(
          create: (BuildContext context) => Buildings(),
        ),
        ChangeNotifierProvider<Houses>(
            create: (BuildContext context) => Houses())
      ],
      child: MaterialApp(
        title: 'HomER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: WelcomePage(),
        // WelcomePage(),

        routes: {
          LoginPage.id: (context) => LoginPage(),
          TenetHome.id: (context) => TenetHome(),
          TenetProfile.id: (context) => TenetProfile(),
          HousesOverviewScreen.id: (_) => HousesOverviewScreen(),
          BuildingsOverviewScreen.id: (context) => BuildingsOverviewScreen(),
          PaymentHistory.id: (context) => PaymentHistory(),
          PaymentHistoryOwner.id: (context) => PaymentHistoryOwner(),
          PaymentDetails.id: (context) => PaymentDetails(),
          ComplaintPage.id: (context) => ComplaintPage(),
          AddHouse.id: (_) => AddHouse(),
          OwnerChat.id: (_) => OwnerChat(),
          PresentHome.id: (_) => PresentHome(),
          AddingBuilding.id: (_) => AddingBuilding(),
          HouseDetails.id: (_) => HouseDetails(),
          SearchHousePage.id: (_) => SearchHousePage(),
          FilePickerPage.id: (_) => FilePickerPage(),
          ImagePreview.id: (_) => ImagePreview(),
          ManageTenet.id: (_) => ManageTenet()
        },
      ),
    );
  }
}
