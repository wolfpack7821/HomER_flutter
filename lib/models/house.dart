import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class House with ChangeNotifier {
  final String buildId;
  final String houseId;
  final String ownerId;
  final String houseName;
  final String houseNumber;
  final String tenantName;
  final String tenantUname;
  final String tenetContact;
  final String tenantIdProof;
  final String houseFiles;
  final houseAdv;
  final contactNO;
  final houseRent;
  final String houseAddress;
  final String houseImage;
  final houseMaintenance;
  final bool isHouseWaterFixed;
  final houseWater;
  final rating;
  final String review;
  final noOfTenets;
  bool isVacant;
  final tenetEmail;
  final tenetId;

  House({
    @required this.buildId,
    @required this.houseId,
    @required this.houseName,
    @required this.houseNumber,
    @required this.houseImage,
    this.tenantName,
    this.tenantUname,
    this.tenetEmail,
    this.tenetId,
    @required this.tenantIdProof,
    this.tenetContact,
    @required this.houseAddress,
    @required this.houseFiles,
    @required this.contactNO,
    @required this.houseAdv,
    @required this.houseRent,
    @required this.houseMaintenance,
    @required this.isHouseWaterFixed,
    this.noOfTenets = 0,
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

  Future<House> findById(String id) async {
    // final user = FirebaseAuth.instance.currentUser;
    final houseData =
        await FirebaseFirestore.instance.collection('houses').doc(id).get();
    House house = House(
        buildId: houseData['buildId'],
        houseId: houseData.id,
        ownerId: houseData['ownerId'],
        houseName: houseData['houseName'],
        houseNumber: houseData['houseNumber'],
        houseImage: houseData['houseImage'],
        tenantName: houseData['tenantName'],
        tenantUname: houseData['tenantUname'],
        tenantIdProof: houseData['tenantIdProof'],
        houseAddress: houseData['houseAddress'],
        houseFiles: houseData['houseFiles'],
        contactNO: houseData['contactNO'],
        houseAdv: houseData['houseAdv'],
        houseRent: houseData['houseRent'],
        houseMaintenance: houseData['houseMaintenance'],
        isHouseWaterFixed: houseData['isHouseWaterFixed'],
        isVacant: houseData['isVacant'],
        rating: houseData['rating'],
        review: houseData['review'],
        houseWater: houseData['houseWater'],
        noOfTenets: houseData['noOfTenets'],
        tenetContact: houseData['tenetContact'],
        tenetEmail: houseData['tenetEmail'],
        tenetId: houseData['tenetId']);
    return house;
  }

 Future< void> addHouse(House house, File _image) async {
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
      'isVacant': house.isVacant,
      'noOfTenets': house.noOfTenets,
      'tenetContact': house.tenetContact,
      'tenetEmail': house.tenetEmail,
      'tenetId': house.tenetId,
    }).then((value) async {
      final ref =  FirebaseStorage.instance
          .ref()
          .child('houseImages')
          .child(value.id + '.jpg');
      await ref.putFile(_image).whenComplete(() => null);
      final imageUrl = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('houses')
          .doc(value.id)
          .update({'houseImage': imageUrl});
      final build = await FirebaseFirestore.instance
          .collection('building')
          .doc(user.uid)
          .collection('building${user.uid}')
          .doc(house.buildId)
          .get();
      List h = build['houses'];
      List hNo = build['houseNo'];
      List hName = build['houseName'];
      h.add(value.id);
      hNo.add(house.houseNumber);
      hName.add(house.houseName);
      await FirebaseFirestore.instance
          .collection('building')
          .doc(user.uid)
          .collection('building${user.uid}')
          .doc(house.buildId)
          .update({'houses': h, 'houseNo': hNo, 'houseName': hName});
      print(value.id);
    });
    notifyListeners();
  }

  void deleteHouse(String id) {
    _houses.remove(_houses.firstWhere((element) => element.houseId == id));
    notifyListeners();
  }
}
