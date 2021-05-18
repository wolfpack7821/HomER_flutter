import 'package:flutter/foundation.dart';

class House with ChangeNotifier{
  final String buildId;
  final String houseId;
  final String houseName;
  final String houseNumber;
  final String tenantName;
  final String tenantUname;
  final String tenantIdProof;
  final String houseAgreement;
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
    @required this.houseAgreement,
    @required this.contactNO,
    @required this.houseAdv,
    @required this.houseRent,
    @required this.houseMaintenance,
    @required this.isHouseWaterFixed,
    this.houseWater,
    this.rating,
    this.review,
    this.isVacant = true,
  });
}


class Houses with ChangeNotifier{
List<House> _houses=[
        House(
        buildId: "01",
        houseId: "101",
        houseName: 'house2',
        houseImage: 'https://sumesshmenonassociates.com/wp-content/uploads/2020/10/emirate-hills-front-1.jpg',
        houseAddress: 'this is a address of the house',
        houseNumber: "G01",
        contactNO: 9707027277,
        tenantName: "Goutham K",
        tenantUname: "k_gout",
        tenantIdProof: "kgoutIdProof",
        houseAgreement: "G01Agree",
        houseAdv: 50000.00,
        houseRent: 10000.00,
        review: 'average',
        houseMaintenance: 500.00,
        isHouseWaterFixed: false,
        isVacant: false
      ),
      House(
        buildId: "02",
        houseId: "101",
        houseName: 'House1',
        houseNumber: "101",
         houseImage: 'https://sumesshmenonassociates.com/wp-content/uploads/2020/10/emirate-hills-front-1.jpg',
        houseAddress: 'this is a address of the house',
        tenantName: "Bala ",
        tenantUname: "bala_dbs",
        contactNO: 9707027277,
        tenantIdProof: "balaIdProof",
        houseAgreement: "G01Agree",
        houseAdv: 52000.00,
        houseRent: 11000.00,
        houseMaintenance: 400.00,
        review: 'Good',
        isHouseWaterFixed: false,
        isVacant: false
      ),
       House(
        buildId: "03",
        houseId: "103",
        houseName: 'house3',
        houseNumber: "103",
        contactNO: 9707027277,
         houseImage: 'https://sumesshmenonassociates.com/wp-content/uploads/2020/10/emirate-hills-front-1.jpg',
        houseAddress: 'this is a address of the house',
        tenantName: "",
        tenantUname: "",
        tenantIdProof: "",
        houseAgreement: "G01Agree",
        houseAdv: 52000.00,
        houseRent: 11000.00,
        houseMaintenance: 400.00,
        review: 'bad',
        isHouseWaterFixed: false,
        isVacant: true
      ),
];

 List<House> get houses {
    return [..._houses];
  }

  House findById(String id) {
    return _houses.firstWhere((houses) => houses.houseId == id);
  }
  void addHouse( House house){
    _houses.add(house);
    notifyListeners();
  }
  void deleteHouse(String id){
    _houses.remove(_houses.firstWhere((element) => element.houseId == id));
    notifyListeners();
  }

}