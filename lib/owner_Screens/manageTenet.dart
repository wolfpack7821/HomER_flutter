import 'package:flutter/material.dart';
import './uploadFiles.dart';

class ManageTenet extends StatelessWidget {
  static const id = '/manage Tenets';

   final _tenetNameFocusNode = FocusNode();
  final _noOTenetFocusNode = FocusNode();
  final _contactFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Managing Tenet'),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text('save',style: TextStyle(fontSize: 18),),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Form(
              key: _form,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _tenetNameFocusNode,
                  decoration: InputDecoration(labelText: 'Tenet Name'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _contactFocusNode,
                  decoration: InputDecoration(labelText: 'Tenet Number'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  focusNode: _noOTenetFocusNode,
                  decoration: InputDecoration(labelText: 'Number of Tenets'),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please provide a value.';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Tenet Id Proof'),
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
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
