import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/building.dart';
import './building_item.dart';

class BuildingsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final buildingsData = Provider.of<Buildings>(context);
    final loadedBuildings = buildingsData.items;
    return loadedBuildings.length == 0
        ? Center(
            child: Image.asset(
              'assets/waiting.png',
              height: MediaQuery.of(context).size.height*.7
            )
          )
        : GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: loadedBuildings.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 5 / 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (ctx, i) => BuildingItem(
              buildId: loadedBuildings[i].buildId,
              buildName: loadedBuildings[i].buildName,
              isHome: loadedBuildings[i].isHome,
            ),
          );
  }
}
