// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../owner_Screens/houses_overview_screen.dart';
import '../models/building.dart';
import '../owner_Screens/buildings_overview_screen.dart';
import '../owner_Screens/edit_house_screen.dart';
import '../owner_Screens/houseDetails.dart';


class BuildingItem extends StatelessWidget {
  final String buildId;
  final String buildName;
  final bool isHome;
  final String buildAddress;
  final String maintenence;
  final List houses;

  final color = Colors.deepPurple;

  BuildingItem(
      {@required this.buildId,
      @required this.buildName,
      @required this.isHome,
      @required this.buildAddress,
      @required this.houses,
      @required this.maintenence});

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;

    // final build =FirebaseFirestore.instance
    //           .collection('building')
    //           .doc(user.uid)
    //           .collection('building${user.uid}').doc(buildId).get();
    final loadedBuilding = Building(
        buildId: buildId,
        buildName: buildName,
        buildAddress: buildAddress,
        maintenence: maintenence,
        isHome: isHome,
        houses: houses);
    return GestureDetector(
      onTap: () {
        if (isHome) {
          loadedBuilding.houses.isEmpty
              ? Navigator.of(context).pushNamed(AddHouse.id, arguments: buildId)
              : Navigator.of(context).pushNamed(HouseDetails.id,
                  arguments: loadedBuilding.houses[0]);
        } else {
          Navigator.of(context)
              .pushNamed(HousesOverviewScreen.id, arguments: buildId);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35.0,
                  width: 35.0,
                  child: Icon(
                    Icons.home_work_outlined,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 0.0),
                  child: Text(
                    buildName.length > 25
                        ? '${buildName.substring(0, 25)}...'
                        : buildName,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 0.0),
                      child: Text(
                        isHome ? 'Indvidual House' : 'Apartment',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 42,
                ),
                onPressed: () {
                  print(buildId);
                  Provider.of<Buildings>(context, listen: false)
                      .deleteBuild(buildId);
                  Navigator.of(context)
                      .pushReplacementNamed(BuildingsOverviewScreen.id);
                }),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.9),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
