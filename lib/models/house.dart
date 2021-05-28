import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class House with ChangeNotifier {
  final String buildId;
  final String houseId;
  final String ownerId;
  final String houseName;
  final String houseNumber;
  final String tenantName;
  final String tenantUname;
  final String tenantIdProof;
  final String houseFiles;
  final double houseAdv;
  final double contactNO;
  final double houseRent;
  final String houseAddress;
  final String houseImage;
  final double houseMaintenance;
  final bool isHouseWaterFixed;
  final double houseWater;
  final double rating;
  final String review;
  bool isVacant;

  House({
    @required this.buildId,
    @required this.houseId,
    @required this.houseName,
    @required this.houseNumber,
    @required this.houseImage,
    @required this.tenantName,
    @required this.tenantUname,
    @required this.tenantIdProof,
    @required this.houseAddress,
    @required this.houseFiles,
    @required this.contactNO,
    @required this.houseAdv,
    @required this.houseRent,
    @required this.houseMaintenance,
    @required this.isHouseWaterFixed,
    this.ownerId,
    this.houseWater,
    this.rating,
    this.review,
    this.isVacant = true,
  });
}

class Houses with ChangeNotifier {
  List<House> _houses = [];

  List<House> get houses {
    return [..._houses];
  }

  House findById(String id) {
    return _houses.firstWhere((houses) => houses.houseId == id);
  }

  void addHouse(House house) async {
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('houses').add({
      'buildId': house.buildId,
      'ownerId': user.uid,
      'houseName': house.houseName,
      'houseNumber': house.houseNumber,
      'tenantName': house.tenantName,
      'tenantUname': house.tenantUname,
      'tenantIdProof': house.tenantIdProof,
      'houseFiles': house.houseFiles,
      'houseAdv': house.houseAdv,
      'contactNO': house.contactNO,
      'houseRent': house.houseRent,
      'houseAddress': house.houseAddress,
      'houseImage': house.houseImage,
      'houseMaintenance': house.houseMaintenance,
      'isHouseWaterFixed': house.isHouseWaterFixed,
      'houseWater': house.houseWater,
      'rating': house.rating,
      'review': house.review,
      'isVacant': house.isVacant
    }).then((value) async {
      final build = await FirebaseFirestore.instance
          .collection('building')
          .doc(user.uid)
          .collection('building${user.uid}')
          .doc(house.buildId)
          .get();
      List h = build['houses'];
      h.add(value.id);
      FirebaseFirestore.instance
          .collection('building')
          .doc(user.uid)
          .collection('building${user.uid}')
          .doc(house.buildId)
          .set({'houses': h});
      print(value.id);
    });
    _houses.add(house);
    notifyListeners();
  }

  void deleteHouse(String id) {
    _houses.remove(_houses.firstWhere((element) => element.houseId == id));
    notifyListeners();
  }
}
