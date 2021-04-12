// import 'package:HomER_flutter/widgets/tenet/details_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PresentHome extends StatefulWidget {
  static const id = 'PresentHome';
  @override
  _PresentHomeState createState() => _PresentHomeState();
}

class _PresentHomeState extends State<PresentHome> {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
          'Present Home',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [IconButton(icon: Icon(Icons.camera_alt), onPressed: () {})],
      ),
      body: ListView(
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
                            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.network(
                            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Image.network(
                            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Lotas Apparments Banglore /403',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40.0,5,0,5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  )
                  ,
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'this is the address of the present home',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Rent: ₹1000',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Advance: ₹1000',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )

          // Center(
          //   child: DetailsField('Rent', '1000'),
          // )
        ],
      ),
    );
  }
}
