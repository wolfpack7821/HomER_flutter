import 'package:flutter/material.dart';
import '../models/building.dart';

class AddingBuilding extends StatefulWidget {
  static final id = '/Add Building';
  @override
  _AddingBuildingState createState() => _AddingBuildingState();
}

class _AddingBuildingState extends State<AddingBuilding> {
  final _addressFocusNode = FocusNode();
  final _maintenenceFocusNode = FocusNode();
  final _buildnameFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  var _addBuild = Building(
    buildId: '',
    buildAddress: 'bcj',
    buildName: '',
    maintenence: '',
    houses: [],
    isHome: false,
  );
  void toggleSwitch(bool value) {
    if (_addBuild.isHome == false) {
      setState(() {
        _addBuild.isHome = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        _addBuild.isHome = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Add Building',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Building Name'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_buildnameFocusNode);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _addBuild = Building(
                        buildName: value,
                        buildAddress: _addBuild.buildAddress,
                        maintenence: _addBuild.maintenence,
                        isHome: _addBuild.isHome,
                        buildId: DateTime.now().toString(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_addressFocusNode);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _addBuild = Building(
                        buildAddress: value,
                        buildName: _addBuild.buildName,
                        maintenence: _addBuild.maintenence,
                        isHome: _addBuild.isHome,
                        buildId: DateTime.now().toString(),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        labelText: 'Maintanence details',
                        border: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        hintText: 'Example - +91 00000 00000',
                        focusColor: Colors.purple[900]),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_maintenenceFocusNode);
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _addBuild = Building(
                        maintenence: value,
                        buildAddress: _addBuild.buildAddress,
                        buildName: _addBuild.buildName,
                        isHome: _addBuild.isHome,
                        buildId: DateTime.now().toString(),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Is a Indivudual House:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Switch(
                        onChanged: toggleSwitch,
                        value: _addBuild.isHome,
                        inactiveThumbColor: Colors.black,
                        inactiveTrackColor: Colors.grey,
                        activeColor: Colors.redAccent,
                        activeTrackColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).textTheme.button.color,
                        child: Text(
                          'Save Building',
                        ),
                        onPressed: () {
                          print(
                              'Added-${_addBuild.buildAddress},${_addBuild.buildId},${_addBuild.buildName},${_addBuild.maintenence},${_addBuild.isHome}');
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
