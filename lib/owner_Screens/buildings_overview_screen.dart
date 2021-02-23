import 'package:flutter/material.dart';

import '../widgets/buildings_grid.dart';

class BuildingsOverviewScreen extends StatefulWidget {
  static const id ='buildingoverviewScreen';

  @override
  _BuildingsOverviewScreenState createState() => _BuildingsOverviewScreenState();
}

class _BuildingsOverviewScreenState extends State<BuildingsOverviewScreen> {
  @override
  void initState() {
    setState(() {
      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_open,
            color: Colors.purple,
            size: 32,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: Text(
          'HomER',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.question_answer_rounded), onPressed: (){}),
        ],
      ),
      drawer: Drawer(),
      body: BuildingsGrid(),
    );
  }
}
