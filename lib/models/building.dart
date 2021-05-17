import 'package:flutter/foundation.dart';

class Building {
  final String buildId;
  final String buildName;
  final String buildAddress;
  List<String> houses;
  final String maintenence;
  bool isHome;

  Building({
    @required this.buildId,
    @required this.buildName,
    @required this.buildAddress,
    this.houses,
    @required this.maintenence,
    this.isHome = false,
  });
}

class Buildings with ChangeNotifier {
  List<Building> _items = [
    // Building(
    //     buildId: "01",
    //     buildName: "Building-1",
    //     buildAddress: "Address of Building-1",
    //     maintenence: 'bvdsj',
    //     houses: ['101', '201', '301', '401'],
    //     isHome: false),
    // Building(
    //   buildId: "02",
    //   buildName: "Building-2",
    //   buildAddress: "Address of Building-2",
    //   maintenence: 'bvdsj',
    //   houses: ['101'],
    //   isHome: true,
    // ),
    // Building(
    //     buildId: "03",
    //     buildName: "Building-3",
    //     buildAddress: "Address of Building-3",
    //     maintenence: 'bvdsj',
    //     houses: ['103'],
    //     isHome: false),
    // Building(
    //     buildId: "04",
    //     buildName: "Building-4",
    //     buildAddress: "Address of Building-4",
    //     maintenence: 'bvdsj',
    //     houses: ['301'],
    //     isHome: false),
  ];

  List<Building> get items {
    return [..._items];
  }

  Building findById(String id) {
    return _items.firstWhere((building) => building.buildId == id);
  }

  void addBuilding(Building value) {
    print(value.houses);
    value.houses.remove('1');
    print(value.houses.length);
    // value.houses.length=0;
    _items.add(value);
    notifyListeners();
  }

  void addHouse(String bId, String hId) {
    _items.firstWhere((element) => element.buildId == bId).houses.add(hId);
    notifyListeners();
  }

  void deleteBuild(String id) {
    _items.remove(_items.firstWhere((element) => element.buildId == id));
    print('removed');
    notifyListeners();
  }

  void deleteHouse(String bId, String hId) {
    _items.firstWhere((element) => element.buildId == bId).houses.remove(hId);
    print('removed');
    notifyListeners();
  }
}
