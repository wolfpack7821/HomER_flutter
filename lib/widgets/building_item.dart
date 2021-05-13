import 'package:HomER_flutter/owner_Screens/edit_house_screen.dart';
import 'package:flutter/material.dart';

import '../owner_Screens/houses_overview_screen.dart';

class BuildingItem extends StatelessWidget {
  final String buildId;
  final String buildName;
  final bool isHome;

  final color = Colors.deepPurple;

  BuildingItem({this.buildId, this.buildName, this.isHome});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        isHome?Navigator.of(context).pushNamed(AddHouse.id):Navigator.of(context).pushNamed(HousesOverviewScreen.id, arguments: buildId);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: Icon(
                Icons.home_work_outlined, color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
              child: Text(
                buildName,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
              child: Text(
                isHome?'Indvidual House':'Apartment',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
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
