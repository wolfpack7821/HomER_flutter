import 'package:HomER_flutter/widgets/tenet/drawer.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
class TenetProfile extends StatefulWidget {
  static const id = 'Profile';
  @override
  _TenetProfileState createState() => _TenetProfileState();
}

class _TenetProfileState extends State<TenetProfile> {
  Map<String, dynamic> user = {
    'address': '296,Thiruverkadu,chennai-77',
  };
  bool _isEdit = false;
  TextEditingController _userCountryController = TextEditingController();
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
        // centerTitle: true,
        title: Text(
          'PROFILE',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.question_answer_rounded), onPressed: (){}),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: <Widget>[
            displayUserInformation(context),
          ],
        ),
      ),
    );
  }

  Widget tiles(Icon icon, String listTitle, String subTitle) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: icon,
          title: Text(listTitle),
          subtitle: Text(
            subTitle,
          ),
        ),
      ),
    );
  }

  Widget displayUserInformation(context) {

    _userCountryController.text = user['address'];
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: tiles(Icon(Icons.people), 'Name',
              'name'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: tiles(
              Icon(Icons.email), 'Email', 'Email'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: tiles(Icon(Icons.date_range_rounded), 'Created:',
              'Date'),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Address'),
                        subtitle: Text(
                          '${_userCountryController.text}',
                        ),
                        trailing: IconButton(
                          color: Colors.deepOrange,
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              _isEdit = !_isEdit;
                            });
                          },
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
