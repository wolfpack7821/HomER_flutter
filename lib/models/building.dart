import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class Building {
  final String buildId;
  final String buildName;
  final String buildAddress;
  List houses;
  List houseNo;
  List houseName;
  final String maintenence;
  bool isHome;

  Building({
    @required this.buildId,
    @required this.buildName,
    @required this.buildAddress,
    this.houses,
    this.houseNo,
    this.houseName,
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
    value.houseName.remove('1');
    value.houseNo.remove('1');
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
      'houseName': value.houseName,
      'houseNo': value.houseNo,
      'isHome': value.isHome,
    }).then((value) => print(value.id));

    notifyListeners();
  }

  void deleteBuild(String id) async {
    final user = FirebaseAuth.instance.currentUser;
    final build = await FirebaseFirestore.instance
        .collection('building')
        .doc(user.uid)
        .collection('building${user.uid}')
        .doc(id)
        .get();
    final houses = build['houses'] as List;
    houses.forEach((element) async {
      await FirebaseFirestore.instance
          .collection('houses')
          .doc(element)
          .get()
          .then((value) async {
        print('hid:${value['tenetId']}');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(value['tenetId'])
            .get()
            .then((value) {
          print('id:${value.id}');
        });
        await FirebaseFirestore.instance
            .collection('chat$element')
            .get()
            .then((value) {
          for (var data in value.docs) {
            FirebaseFirestore.instance
                .collection('chat$element')
                .doc()
                .delete();
          }
        });
        await FirebaseFirestore.instance
            .collection('users')
            .doc(value['tenetId'])
            .update({'house': null}).then((value) {
          print('removed');
        });
      });

      FirebaseFirestore.instance
          .collection('houses')
          .doc(element)
          .delete()
          .then((value) {
        print('removed');
      });
    });
    await FirebaseFirestore.instance
        .collection('building')
        .doc(user.uid)
        .collection('building${user.uid}')
        .doc(id)
        .delete()
        .then((value) {
      print('removed');
    });
    notifyListeners();
  }

  void deleteHouse(String bId, String hId) {
    _items.firstWhere((element) => element.buildId == bId).houses.remove(hId);
    print('removed');
    notifyListeners();
  }
}
