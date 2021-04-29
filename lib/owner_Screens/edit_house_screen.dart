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
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'HouseNumber'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Rent'),
                textInputAction: TextInputAction.next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
