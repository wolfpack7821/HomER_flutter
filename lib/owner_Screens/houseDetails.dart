import 'package:HomER_flutter/models/house.dart';
import 'package:HomER_flutter/owner_Screens/edit_house_screen.dart';
import 'package:HomER_flutter/widgets/owner/owner_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HouseDetails extends StatefulWidget {
  static const id = 'HouseDetails';
  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  Widget fields(String field, value) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 5),
          child: Text(
            '$field:',
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 5),
          child: Text(
            '$value',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final houseId = ModalRoute.of(context).settings.arguments as String;
    House house = Provider.of<Houses>(context,listen: false).findById(houseId);
    return Scaffold(
      key: _scaffoldKey,
      drawer: OwnerDrawer(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_open,
            color: Colors.purple,
            size: 32,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'House Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          FlatButton(onPressed: () {}, child: Text('Manage Tenet')),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {})
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 1, 12, 1),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.network('${house.houseImage}'),
                        ),
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 10),
              child: Text(
                '${house.houseName}/${house.houseNumber}',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 5, 0, 5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '4',
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.star,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 10),
              child: Text(
                '${house.houseAddress}',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            fields('Rent', '₹${house.houseRent}'),
            fields('Advance', '₹${house.houseAdv}'),
            fields('Owner', 'XYZ'),
            fields('Owner ContactNo', '${house.contactNO}'),
            fields('Menitenance Details', '₹${house.houseMaintenance}'),
            fields('TenetName', '${house.tenantName}'),
            fields('No Of Members', '4'),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 10),
                  child: Text(
                    'Files related to the house',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download_sharp),
                  label: Text('download'),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.of(context).pushNamed(AddHouse.id);
          },
          child: Icon(
            Icons.edit,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
