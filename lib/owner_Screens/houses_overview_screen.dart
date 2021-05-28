import 'package:HomER_flutter/owner_Screens/edit_house_screen.dart';
import 'package:HomER_flutter/owner_Screens/houseDetails.dart';
import 'package:HomER_flutter/owner_Screens/owner_chat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/building.dart';

class HousesOverviewScreen extends StatefulWidget {
  static const id = '/houses-overview-screen';

  @override
  _HousesOverviewScreenState createState() => _HousesOverviewScreenState();
}

class _HousesOverviewScreenState extends State<HousesOverviewScreen> {
  // Building loadedBuilding;
  Future<dynamic> getData(String buildId) async {
    final user = FirebaseAuth.instance.currentUser;

    final build = await FirebaseFirestore.instance
        .collection('building')
        .doc(user.uid)
        .collection('building${user.uid}')
        .doc(buildId)
        .get();
    return build;
  }

  Future<Building> getBuild(String buildId) async {
    var data = await getData(buildId);
    Building building = Building(
        buildId: buildId,
        buildName: data['buildName'],
        buildAddress: data['buildAddress'],
        maintenence: data['maintenence'],
        houses: data['houses'],
        isHome: data['isHome']);
    return building;
  }

  @override
  Widget build(BuildContext context) {
    final buildId = ModalRoute.of(context).settings.arguments
        as String; // is the building Id
    final loadedBuilding = getBuild(buildId);

    return FutureBuilder(
        future: loadedBuilding,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text('${snapshot.data.buildName}'),
              actions: [
                IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AddHouse.id, arguments: buildId);
                    }),
              ],
            ),
            body: snapshot.data.houses.isEmpty
                ? Center(
                    child: Image.asset('assets/waiting.png',
                        height: MediaQuery.of(context).size.height * .7),
                  )
                : ListView.builder(
                    itemCount: snapshot.data.houses.length,
                    itemBuilder: (ctx, i) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                        elevation: 4,
                        child: ListTile(
                          onLongPress: () {
                            // Provider.of<Houses>(context, listen: false)
                            //     .deleteHouse(snapshot.data.houses[i]);
                            // Provider.of<Buildings>(context, listen: false)
                            //     .deleteHouse(buildId, snapshot.data.houses[i]);
                            // Navigator.of(context).pushReplacementNamed(
                            //     HousesOverviewScreen.id,
                            //     arguments: buildId);
                          },
                          onTap: () {
                            Navigator.of(context).pushNamed(HouseDetails.id,
                                arguments: snapshot.data.houses[i]);
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 25,
                            child: FittedBox(
                              child: Text(
                                snapshot.data.houses[i],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          title: Text('${snapshot.data.houses[i]} tenent'),
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
        });
  }
}
