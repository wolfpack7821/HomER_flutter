import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './uploadFiles.dart';

class ManageTenet extends StatefulWidget {
  static const id = '/manage Tenets';

  @override
  _ManageTenetState createState() => _ManageTenetState();
}

class _ManageTenetState extends State<ManageTenet> {
  Map<String, String> _tenetData = {
    'tusername': '',
    'tname': '',
    'tnumber': '',
    'noOfT': '',
    'tenetEmail': ''
  };

  Future<void> _submit(String id) async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    print(id);

    final tenetData = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: _tenetData['tenetEmail'])
        .get();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(tenetData.docs[0].id)
        .update({'house': id});
    await FirebaseFirestore.instance.collection('houses').doc(id).update({
      'tenantId': tenetData.docs[0].id,
      'tenantUname': _tenetData['tusername'],
      'tenantName': _tenetData['tname'],
      'isVacant': false,
      'noOfTenets': _tenetData['noOfT'],
      'tenetContact': _tenetData['tnumber'],
      'tenetEmail': _tenetData['tenetEmail'],
    });
    int count = 0;
    Navigator.of(context).popUntil((_) => count++ >= 2);
  }

  final _tenetNameFocusNode = FocusNode();
  final _tenetEmailFocusNode = FocusNode();
  final _noOTenetFocusNode = FocusNode();
  final _contactFocusNode = FocusNode();
  final _tenetunameFocusNode = FocusNode();

  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final hId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Managing Tenet'),
        actions: [
          FlatButton(
            onPressed: () {
              _submit(hId);
            },
            child: Text(
              'save',
              style: TextStyle(fontSize: 18),
            ),
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
                    onChanged: (value) {
                      _tenetData['tname'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: _tenetEmailFocusNode,
                    decoration: InputDecoration(labelText: 'Tenet Email'),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _tenetData['tenetEmail'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    focusNode: _tenetunameFocusNode,
                    decoration: InputDecoration(labelText: 'Tenet UserName'),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please provide a value.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      _tenetData['tusername'] = value;
                    },
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
                    onChanged: (value) {
                      _tenetData['tnumber'] = value;
                    },
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
                    onChanged: (value) {
                      _tenetData['noOfT'] = value;
                    },
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
          ),
        ),
      ),
    );
  }
}
