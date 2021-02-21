import 'package:flutter/foundation.dart';

class House {
  final String buildId;
  final String houseId;
  final String houseNumber;
  final String tenantName;
  final String tenantUname;
  final String tenantIdProof;
  final String houseAgreement;
  final double houseAdv;
  final double houseRent;
  final double houseMaintenance;
  final bool isHouseWaterFixed;
  final double houseWater;
  bool isVacant;

  House({
    @required this.buildId,
    @required this.houseId,
    @required this.houseNumber,
    @required this.tenantName,
    @required this.tenantUname,
    @required this.tenantIdProof,
    @required this.houseAgreement,
    @required this.houseAdv,
    @required this.houseRent,
    @required this.houseMaintenance,
    @required this.isHouseWaterFixed,
    this.houseWater,
    this.isVacant = true,
  });
}
