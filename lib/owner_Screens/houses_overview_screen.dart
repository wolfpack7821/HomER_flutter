import 'package:HomER_flutter/owner_Screens/edit_house_screen.dart';
import 'package:HomER_flutter/owner_Screens/owner_chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/buildings_provider.dart';

class HousesOverviewScreen extends StatefulWidget {
  static const id = '/houses-overview-screen';

  @override
  _HousesOverviewScreenState createState() => _HousesOverviewScreenState();
}

class _HousesOverviewScreenState extends State<HousesOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final buildId = ModalRoute.of(context).settings.arguments
        as String; // is the building Id
    final loadedBuilding =
        Provider.of<BuildingsProvider>(context, listen: false)
            .findById(buildId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(loadedBuilding.buildName),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddHouse.id);
              }),
        ],
      ),
      body: ListView.builder(
        itemCount: loadedBuilding.houses.length,
        itemBuilder: (ctx, i) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            elevation: 4,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                radius: 25,
                child: FittedBox(
                  child: Text(
                    loadedBuilding.houses[i],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              title: Text('${loadedBuilding.houses[i]} tenent'),
              subtitle: Text(
                'username',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.messenger_outline),
                  onPressed: () {
                    Navigator.of(context).pushNamed(OwnerChat.id);
                  }),
            ),
          );
        },
      ),
    );
  }
}
