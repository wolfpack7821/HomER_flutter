import 'package:HomER_flutter/widgets/owner/owner_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HouseDetails extends StatefulWidget {
  static const id = 'HouseDetails';
  @override
  _HouseDetailsState createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final houseId = ModalRoute.of(context).settings.arguments as String;
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
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.network(
                              'https://sumesshmenonassociates.com/wp-content/uploads/2020/10/emirate-hills-front-1.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.network(
                              'https://sumesshmenonassociates.com/wp-content/uploads/2020/10/emirate-hills-front-1.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
                        child: Container(
                          child: Image.network(
                              'https://sumesshmenonassociates.com/wp-content/uploads/2020/10/emirate-hills-front-1.jpg'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
              child: Text(
                'Lotas Apparments Banglore /403 $houseId',
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
              padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
              child: Text(
                'This is the address of the you\'re home',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
                  child: Text(
                    'Rent: ₹1000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
                  child: Text(
                    'Advance: ₹1000',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
              child: Text(
                'Owner: XYZ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
              child: Text(
                'Owner contact: 9809303909',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
              child: Text(
                'Maintenance Details: 789487395',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
              child: Text(
                'Tenetname: Tenet x',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
              child: Text(
                'Number of members in house: 4',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0,10,8,10),
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
        child: RaisedButton.icon(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.deepPurple,
          onPressed: () {},
          icon: Icon(
            Icons.edit,
            size: 20,
            color: Colors.white,
          ),
          label: Text(
            'edit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
