import 'package:HomER_flutter/models/house.dart';
import 'package:HomER_flutter/owner_Screens/image_preview.dart';
import 'package:HomER_flutter/owner_Screens/uploadFiles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddHouse extends StatefulWidget {
  static const id = '/edit-house';
  @override
  _AddHouseState createState() => _AddHouseState();
}

class _AddHouseState extends State<AddHouse> {
  final _houseNameFocusNode = FocusNode();
  final _maintenenceFocusNode = FocusNode();
  final _houseNumberFocusNode = FocusNode();
  final _houseRentFocusNode = FocusNode();
  final _houseAdvanceFocusNode = FocusNode();
  final _houseAddressFocusNode = FocusNode();
  final _contactFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  File _image;
  var _addHouse;
  Future<void> _submit(String id, bool isHome) async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    FocusScope.of(context).unfocus();
    _form.currentState.save();
    await Provider.of<Houses>(context, listen: false)
        .addHouse(_addHouse, _image);
    int count = 0;
    if (isHome) {
      Navigator.of(context).popUntil((_) => count++ >= 1);
    } else {
      Navigator.of(context).popUntil((_) => count++ >= 2);
    }
  }

  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.camera,
        imageQuality: 30,
        maxHeight: 200,
        maxWidth: 50);

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
    final lists = ModalRoute.of(context).settings.arguments as List;
    final id = lists[0];
    final isHome = lists[1];
    _addHouse = House(
        contactNO: 0,
        buildId: id,
        houseId: '',
        houseName: '',
        houseNumber: '',
        houseImage: '',
        tenantName: '',
        tenantUname: '',
        tenantIdProof: '',
        houseAddress: '',
        houseFiles: '',
        houseAdv: 0,
        houseRent: 0,
        houseMaintenance: 0,
        isHouseWaterFixed: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Add House'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: _image != null
                  ? () {
                      _submit(id, isHome);
                    }
                  : null,
              child: Text(
                'Save House',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              Text('Please upload the image before adding the fields'),
              Row(
                children: [
                  FlatButton.icon(
                    onPressed: getImage,
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.deepPurple,
                    ),
                    label: Text(
                      'Upload Images of house',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                  FlatButton(
                    onPressed: _image != null
                        ? () {
                            Navigator.of(context)
                                .pushNamed(ImagePreview.id, arguments: _image);
                          }
                        : null,
                    child: Text(
                      'Preview',
                      style: _image == null
                          ? TextStyle(color: Colors.grey)
                          : TextStyle(color: Colors.deepOrange),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _houseNameFocusNode,
                  decoration: InputDecoration(labelText: 'House Name'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _addHouse = House(
                        contactNO: _addHouse.contactNO,
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: value,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseFiles: _addHouse.houseFiles,
                        houseAdv: _addHouse.houseAdv,
                        houseRent: _addHouse.houseRent,
                        houseMaintenance: _addHouse.houseMaintenance,
                        isHouseWaterFixed: _addHouse.isHouseWaterFixed,
                        isVacant: _addHouse.isVacant);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _houseNumberFocusNode,
                  decoration: InputDecoration(labelText: 'HouseNumber'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _addHouse = House(
                        contactNO: _addHouse.contactNO,
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: value,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseFiles: _addHouse.houseFiles,
                        houseAdv: _addHouse.houseAdv,
                        houseRent: _addHouse.houseRent,
                        houseMaintenance: _addHouse.houseMaintenance,
                        isHouseWaterFixed: _addHouse.isHouseWaterFixed,
                        isVacant: _addHouse.isVacant);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _contactFocusNode,
                  decoration: InputDecoration(labelText: 'Contact No'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _addHouse = House(
                        contactNO: double.parse(value),
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseFiles: _addHouse.houseFiles,
                        houseAdv: _addHouse.houseAdv,
                        houseRent: _addHouse.houseRent,
                        houseMaintenance: _addHouse.houseMaintenance,
                        isHouseWaterFixed: _addHouse.isHouseWaterFixed,
                        isVacant: _addHouse.isVacant);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _houseRentFocusNode,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Rent'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _addHouse = House(
                        contactNO: _addHouse.contactNO,
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseFiles: _addHouse.houseFiles,
                        houseAdv: _addHouse.houseAdv,
                        houseRent: double.parse(value),
                        houseMaintenance: _addHouse.houseMaintenance,
                        isHouseWaterFixed: _addHouse.isHouseWaterFixed,
                        isVacant: _addHouse.isVacant);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _houseAdvanceFocusNode,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'House Advance'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _addHouse = House(
                        contactNO: _addHouse.contactNO,
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseFiles: _addHouse.houseFiles,
                        houseAdv: double.parse(value),
                        houseRent: _addHouse.houseRent,
                        houseMaintenance: _addHouse.houseMaintenance,
                        isHouseWaterFixed: _addHouse.isHouseWaterFixed,
                        isVacant: _addHouse.isVacant);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _houseAddressFocusNode,
                  decoration: InputDecoration(labelText: 'House Address'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _addHouse = House(
                        contactNO: _addHouse.contactNO,
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: value,
                        houseFiles: _addHouse.houseFiles,
                        houseAdv: _addHouse.houseAdv,
                        houseRent: _addHouse.houseRent,
                        houseMaintenance: _addHouse.houseMaintenance,
                        isHouseWaterFixed: _addHouse.isHouseWaterFixed,
                        isVacant: _addHouse.isVacant);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _maintenenceFocusNode,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'House Maintenance',
                    border: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _addHouse = House(
                        contactNO: _addHouse.contactNO,
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseFiles: _addHouse.houseFiles,
                        houseAdv: _addHouse.houseAdv,
                        houseRent: _addHouse.houseRent,
                        houseMaintenance: double.parse(value),
                        isHouseWaterFixed: _addHouse.isHouseWaterFixed,
                        isVacant: _addHouse.isVacant);
                  },
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
                  Navigator.of(context).pushNamed(FilePickerPage.id);
                },
                icon: Icon(
                  Icons.file_upload,
                  color: Colors.black,
                ),
                label: Text(
                  'Upload Files',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
