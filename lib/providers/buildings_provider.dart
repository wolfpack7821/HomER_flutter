import 'package:flutter/material.dart';

import '../models/building.dart';


class BuildingsProvider with ChangeNotifier {
  List<Building> _items = [
    Building(
      buildId: "01",
      buildName: "Building-1",
      buildAddress: "Address of Building-1",
      houses: [
        {
          "buildId": "01",
          "houseId": "G01",
          "houseNumber": "G01",
          "tenantName": "Goutham K",
          "tenantUname": "k_gout",
          "tenantIdProof": "kgoutIdProof",
          "houseAgreement": "G01Agree",
          "houseAdv": 50000.00,
          "houseRent": 10000.00,
          "houseMaintenance": 500.00,
          "isHouseWaterFixed": false,
        },
        {
          "buildId": "01",
          "houseId": "101",
          "houseNumber": "101",
          "tenantName": "Goutham K",
          "tenantUname": "k_gout",
          "tenantIdProof": "kgoutIdProof",
          "houseAgreement": "G01Agree",
          "houseAdv": 50000.00,
          "houseRent": 10000.00,
          "houseMaintenance": 500.00,
          "isHouseWaterFixed": false,
        },
        {
          "buildId": "01",
          "houseId": "201",
          "houseNumber": "G01",
          "tenantName": "Goutham K",
          "tenantUname": "k_gout",
          "tenantIdProof": "kgoutIdProof",
          "houseAgreement": "G01Agree",
          "houseAdv": 50000.00,
          "houseRent": 10000.00,
          "houseMaintenance": 500.00,
          "isHouseWaterFixed": false,
        },
        {
          "buildId": "01",
          "houseId": "301",
          "houseNumber": "G01",
          "tenantName": "Goutham K",
          "tenantUname": "k_gout",
          "tenantIdProof": "kgoutIdProof",
          "houseAgreement": "G01Agree",
          "houseAdv": 50000.00,
          "houseRent": 10000.00,
          "houseMaintenance": 500.00,
          "isHouseWaterFixed": false,
        },
        {
          "buildId": "01",
          "houseId": "401",
          "houseNumber": "G01",
          "tenantName": "Goutham K",
          "tenantUname": "k_gout",
          "tenantIdProof": "kgoutIdProof",
          "houseAgreement": "G01Agree",
          "houseAdv": 50000.00,
          "houseRent": 10000.00,
          "houseMaintenance": 500.00,
          "isHouseWaterFixed": false,
        },
      ],
    ),
    Building(
      buildId: "02",
      buildName: "Building-2",
      buildAddress: "Address of Building-2",
    ),
    Building(
      buildId: "03",
      buildName: "Building-3",
      buildAddress: "Address of Building-3",
    ),
    Building(
      buildId: "04",
      buildName: "Building-4",
      buildAddress: "Address of Building-4",
    ),
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
