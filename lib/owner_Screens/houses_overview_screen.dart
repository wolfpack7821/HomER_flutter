import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/buildings_provider.dart';

class HousesOverviewScreen extends StatelessWidget {
  static const routeName = '/houses-overview-screen';

  @override
  Widget build(BuildContext context) {
    final buildId = ModalRoute.of(context).settings.arguments
        as String; // is the building Id
    final loadedBuilding =
        Provider.of<BuildingsProvider>(context, listen: false)
            .findById(buildId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedBuilding.buildName),
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
                  child: Text(loadedBuilding.houses[i]['houseId'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
              title: Text('Goutham K'),
              subtitle: Text(
                'username',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
