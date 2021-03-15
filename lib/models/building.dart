import 'package:flutter/foundation.dart';


class Building {
  final String buildId;
  final String buildName;
  final String buildAddress;
  List<Map<String, dynamic>> houses;
  bool isHome;

  Building({
    @required this.buildId,
    @required this.buildName,
    @required this.buildAddress,
    this.houses,
    this.isHome = false,
  });
}
