import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessageOwner extends StatefulWidget {
  final String hId;
  NewMessageOwner(this.hId);
  @override
  _NewMessageOwnerState createState() => _NewMessageOwnerState();
}

class _NewMessageOwnerState extends State<NewMessageOwner> {
  var _message = '';
  final _controller = new TextEditingController();
  final _billingContoller = new TextEditingController();
  double elec = 0;
  double water = 0;
  double misc = 0;

  var billingMessage = '';
  final user = FirebaseAuth.instance.currentUser;
  void _sendPaymentMessage(String hid) async {
    final user = FirebaseAuth.instance.currentUser;
    final houseData =
        await FirebaseFirestore.instance.collection('houses').doc(hid).get();
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    final message = await FirebaseFirestore.instance
        .collection('billingMessage')
        .doc('message${user.uid}')
        .get();
    final double sum = houseData['houseRent'] +
        houseData['houseMaintenance'] +
        elec +
        water +
        misc;
        elec =0;
        water =0;
        misc=0;
    final paymessage = '${message['message']}: ₹${sum.toString()}';
    if (message['message'] == null) {
      return;
    }
    FirebaseFirestore.instance.collection('chat${widget.hId}').add({
      'Text': paymessage,
      'value':sum,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'isPay': 1,
      'username': userData['username'],
    });
  }

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    FirebaseFirestore.instance.collection('chat${widget.hId}').add({
      'Text': _message,
      'createdAt': Timestamp.now(),
      'value':null,
      'isPay': 0,
      'userId': user.uid,
      'username': userData['username'],
    });
    _controller.clear();
    _message = '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: true,
                  enableSuggestions: true,
                  controller: _controller,
                  decoration: InputDecoration(
                      labelText: 'Send a message...', border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      _message = value;
                    });
                  },
                ),
              ),
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.attach_file),
                      onPressed: () {
                        _billMessageDialog(context);
                      }),
                  _message.trim().isEmpty
                      ? FlatButton(
                          child: Text(
                            'initiate Pay',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            _billValueDialog(context);
                          },
                        )
                      : FlatButton(
                          child: Text(
                            'Send',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: _sendMessage,
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _billValueDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Rent,maintenece added automatically'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Electric costs:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .05,
                            width: MediaQuery.of(context).size.width * .18,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              ),
                              onChanged: (value) {
                                elec = double.parse(value);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'water costs:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .05,
                            width: MediaQuery.of(context).size.width * .18,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              ),
                              onChanged: (value) {
                                water = double.parse(value);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Misc costs:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .05,
                            width: MediaQuery.of(context).size.width * .18,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide()),
                              ),
                              onChanged: (value) {
                                misc = double.parse(value);
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('SAVE'),
                onPressed: () {
                  print(billingMessage);
                  _sendPaymentMessage(widget.hId);
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _billMessageDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Write a Periodical message you want to send the tenet for rent,other expenses',
                      softWrap: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _billingContoller,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Send a message for billing...',
                        border: OutlineInputBorder(borderSide: BorderSide()),
                      ),
                      onChanged: (value) {
                        setState(() {
                          billingMessage = value;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('SAVE'),
                onPressed: () {
                  print(billingMessage);
                  FirebaseFirestore.instance
                      .collection('billingMessage')
                      .doc('message${user.uid}')
                      .set({'message': billingMessage});
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
