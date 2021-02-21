import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/buildings_provider.dart';
import './building_item.dart';

class BuildingsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final buildingsData = Provider.of<BuildingsProvider>(context);
    final loadedBuildings = buildingsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedBuildings.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
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
