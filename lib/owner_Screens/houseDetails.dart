import 'package:HomER_flutter/models/house.dart';
import 'package:HomER_flutter/owner_Screens/edit_house_screen.dart';
import 'package:HomER_flutter/owner_Screens/manageTenet.dart';
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
            softWrap: true,
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 5),
          child: Text(
            '$value',
            softWrap: true,
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
    final house = Provider.of<Houses>(context, listen: false).findById(houseId);
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
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ManageTenet.id,arguments: houseId);
              },
              child: Text('Manage Tenet')),
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () {})
        ],
      ),
      body: FutureBuilder(
          future: house,
          builder: (ctx, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
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
                                child: Image.network(
                                    '${snapshot.data.houseImage}'),
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
                      '${snapshot.data.houseName}/${snapshot.data.houseNumber}',
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
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
                      '${snapshot.data.houseAddress}',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  fields('Rent', '₹${snapshot.data.houseRent}'),
                  fields('Advance', '₹${snapshot.data.houseAdv}'),
                  fields('Owner', ''),
                  fields('Owner ContactNo', '${snapshot.data.contactNO}'),

                  fields('tenet ContactNo', '${snapshot.data.tenetContact}'),
                  fields('Menitenance Details',
                      '₹${snapshot.data.houseMaintenance}'),
                  fields('TenetName', '${snapshot.data.tenantName}'),
                  fields('No Of Members', '${snapshot.data.noOfTenets}'),
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
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.of(context).pushNamed(AddHouse.id,arguments: houseId);
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
