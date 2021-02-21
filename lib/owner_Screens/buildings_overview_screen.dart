import 'package:flutter/material.dart';

import '../widgets/buildings_grid.dart';

class BuildingsOverviewScreen extends StatelessWidget {
  // final List<Building> loadedBuildings = allBuildings;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomER'),
      ),
      body: BuildingsGrid(),
    );
  }
}
