import 'package:flutter/material.dart';

import '../models/building.dart';

class BuildingsProvider with ChangeNotifier {
  List<Building> _items = [
    Building(
      buildId: "01",
      buildName: "Building-1",
      buildAddress: "Address of Building-1",
      houses: [
        '101',
        '201',
        '301',
        '401'
      ],
    ),
    Building(
        buildId: "02",
        buildName: "Building-2",
        buildAddress: "Address of Building-2",
        houses: [
         '101'
        ]),
    Building(
        buildId: "03",
        buildName: "Building-3",
        buildAddress: "Address of Building-3",
        houses: [
        '201'
        ]),
    Building(
        buildId: "04",
        buildName: "Building-4",
        buildAddress: "Address of Building-4",
        houses: [
        '301'
        ]),
  ];

  List<Building> get items {
    return [..._items];
  }

  Building findById(String id) {
    return _items.firstWhere((building) => building.buildId == id);
  }

  void addBuilding() {
    // _items.add(value);
    notifyListeners();
  }
}
