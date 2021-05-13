import 'package:HomER_flutter/owner_Screens/houseDetails.dart';
import 'package:flutter/material.dart';

class AddHouse extends StatefulWidget {
  static const id = '/edit-house';
  @override
  _AddHouseState createState() => _AddHouseState();
}

class _AddHouseState extends State<AddHouse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Add House'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              FlatButton.icon(
                onPressed: () {},
                icon: Icon(Icons.camera_alt),
                label: Text('Upload Images of house'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'HouseNumber'),
                textInputAction: TextInputAction.next,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Rent'),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'House Advance'),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'House Maintenance',
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  ),
                  maxLines: 3,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Upload House related doc that should be showen to you\'re Tenet'),
              ),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.file_upload),
                  label: Text('Upload Files')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RaisedButton(
                      color: Colors.deepPurple,
                      onPressed: () {
                        Navigator.of(context).pushNamed(HouseDetails.id ,arguments: 'id');
                      },
                      child: Text(
                        'Save House',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
