import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Building {
  final String buildId;
  final String buildName;
  final String buildAddress;
  List houses;
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
  List<Building> _items = [];

  List<Building> get items {
    return [..._items];
  }


  void addBuilding(Building value) async {
    final user = FirebaseAuth.instance.currentUser;
    print(value.houses);
    value.houses.remove('1');
    print(value.houses.length);
    FirebaseFirestore.instance
        .collection('building')
        .doc(user.uid)
        .collection('building${user.uid}')
        .add({
      'buildName': value.buildName,
      'buildAddress': value.buildAddress,
      'maintenence': value.maintenence,
      'houses': value.houses,
      'isHome': value.isHome,
    }).then((value) => print(value.id));

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
