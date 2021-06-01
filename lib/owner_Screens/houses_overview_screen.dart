import 'package:HomER_flutter/owner_Screens/add_house_screen.dart';
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
        houseNo: data['houseNo'],
        houseName: data['houseName'],
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
                          .pushNamed(AddHouse.id, arguments: [buildId,snapshot.data.isHome]);
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
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onLongPress: () {},
                          onTap: () {
                            Navigator.of(context).pushNamed(HouseDetails.id,
                                arguments: snapshot.data.houses[i]);
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 20,
                            child: FittedBox(
                              child: Text(
                                snapshot.data.houseNo[i],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          title: Text(
                            snapshot.data.houseName[i],
                            style: TextStyle(fontSize: 20),
                          ),
                          trailing: IconButton(
                              icon: Icon(Icons.messenger_outline),
                              onPressed: () {
                                Navigator.of(context).pushNamed(OwnerChat.id,
                                    arguments: snapshot.data.houses[i]);
                              }),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
