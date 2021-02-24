import 'package:flutter/material.dart';

class EditBuildingScreen extends StatefulWidget {
  static const id = '/edit-building';
  @override
  _EditBuildingScreenState createState() => _EditBuildingScreenState();
}

class _EditBuildingScreenState extends State<EditBuildingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
