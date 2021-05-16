import 'package:HomER_flutter/models/house.dart';
import 'package:HomER_flutter/owner_Screens/edit_house_screen.dart';
import 'package:HomER_flutter/owner_Screens/houseDetails.dart';
import 'package:HomER_flutter/owner_Screens/owner_chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/building.dart';

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
        Provider.of<Buildings>(context, listen: false).findById(buildId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(loadedBuilding.buildName),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AddHouse.id, arguments: buildId);
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
              onLongPress: () {
                Provider.of<Houses>(context,listen:false).deleteHouse(loadedBuilding.houses[i]);
                Provider.of<Buildings>(context,listen:false).deleteHouse(buildId, loadedBuilding.houses[i]);
                Navigator.of(context)
                .pushReplacementNamed(HousesOverviewScreen.id, arguments: buildId);
              },
              onTap: () {
                Navigator.of(context).pushNamed(HouseDetails.id,
                    arguments: loadedBuilding.houses[i]);
              },
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
