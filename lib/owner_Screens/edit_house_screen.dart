import 'package:HomER_flutter/models/building.dart';
import 'package:HomER_flutter/models/house.dart';
// import 'package:HomER_flutter/owner_Screens/houseDetails.dart';
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
  final _form = GlobalKey<FormState>();
  File _image;
  var _addHouse = House(
      buildId: '01',
      houseId: DateTime.now().toString(),
      houseName: '',
      houseNumber: '',
      houseImage: 'https://sumesshmenonassociates.com/wp-content/uploads/2020/10/emirate-hills-front-1.jpg',
      tenantName: '',
      tenantUname: '',
      tenantIdProof: '',
      houseAddress: '',
      houseAgreement: '',
      houseAdv: 0,
      houseRent: 0,
      houseMaintenance: 0,
      isHouseWaterFixed: false);

  Future<void> _submit() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    Provider.of<Houses>(context, listen: false).addHouse(_addHouse);
    Provider.of<Buildings>(context,listen: false)
        .addHouse(_addHouse.buildId, _addHouse.houseId);
    Navigator.of(context).pop();    
  }

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
    final id = ModalRoute.of(context).settings.arguments;
    _addHouse = House(
      buildId: id,
      houseId: DateTime.now().toString(),
      houseName: '',
      houseNumber: '',
      houseImage: 'https://sumesshmenonassociates.com/wp-content/uploads/2020/10/emirate-hills-front-1.jpg',
      tenantName: '',
      tenantUname: '',
      tenantIdProof: '',
      houseAddress: '',
      houseAgreement: '',
      houseAdv: 0,
      houseRent: 0,
      houseMaintenance: 0,
      isHouseWaterFixed: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Add House'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
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
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: value,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseAgreement: _addHouse.houseAgreement,
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
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: value,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseAgreement: _addHouse.houseAgreement,
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
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseAgreement: _addHouse.houseAgreement,
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
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseAgreement: _addHouse.houseAgreement,
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
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: value,
                        houseAgreement: _addHouse.houseAgreement,
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
                        buildId: _addHouse.buildId,
                        houseId: _addHouse.houseId,
                        houseName: _addHouse.houseName,
                        houseNumber: _addHouse.houseNumber,
                        houseImage: _addHouse.houseImage,
                        tenantName: _addHouse.tenantName,
                        tenantUname: _addHouse.tenantUname,
                        tenantIdProof: _addHouse.tenantIdProof,
                        houseAddress: _addHouse.houseAddress,
                        houseAgreement: _addHouse.houseAgreement,
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
                        _submit();
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
