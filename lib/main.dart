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
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: BuildingsOverviewScreen(),
        routes: {
          HousesOverviewScreen.routeName: (_) => HousesOverviewScreen(),
        },
      ),
    );
  }
}

