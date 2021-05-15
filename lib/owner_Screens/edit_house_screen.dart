import 'package:HomER_flutter/owner_Screens/houseDetails.dart';
import 'package:HomER_flutter/owner_Screens/image_preview.dart';
import 'package:HomER_flutter/owner_Screens/uploadFiles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddHouse extends StatefulWidget {
  static const id = '/edit-house';
  @override
  _AddHouseState createState() => _AddHouseState();
}

class _AddHouseState extends State<AddHouse> {
  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

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
              Row(
                children: [
                  FlatButton.icon(
                    onPressed: getImage,
                    icon: Icon(Icons.camera_alt),
                    label: Text('Upload Images of house'),
                  ),
                  FlatButton(
                    onPressed: _image != null
                        ? () {
                            Navigator.of(context)
                                .pushNamed(ImagePreview.id, arguments: _image);
                          }
                        : null,
                    child: Text('Preview'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'House Name'),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'HouseNumber'),
                  textInputAction: TextInputAction.next,
                ),
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
                  onPressed: () {
                    Navigator.of(context).pushNamed(FilePickerDemo.id);
                  },
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
                        Navigator.of(context)
                            .pushNamed(HouseDetails.id, arguments: 'id');
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
