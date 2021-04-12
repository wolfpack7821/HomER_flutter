import 'package:HomER_flutter/widgets/owner/owner_drawer.dart';
import 'package:flutter/material.dart';

import '../widgets/buildings_grid.dart';

class BuildingsOverviewScreen extends StatefulWidget {
  static const id = 'buildingoverviewScreen';

  @override
  _BuildingsOverviewScreenState createState() =>
      _BuildingsOverviewScreenState();
}

class _BuildingsOverviewScreenState extends State<BuildingsOverviewScreen> {
  @override
  void initState() {
    setState(() {});
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
          'My Buildings',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _houseFormDialog(context);
              }),
        ],
      ),
      drawer: OwnerDrawer(),
      body: BuildingsGrid(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }

  _houseFormDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(),
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Address'),
                  textInputAction: TextInputAction.next,
                ),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      labelText: 'Maintanence details',
                      border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      hintText: 'Example - +91 00000 00000',
                      focusColor: Colors.purple[900]),
                ),
              ],
            ),
            actions: <Widget>[],
          );
        });
  }
}
