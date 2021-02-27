import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  var _message = '';
  final _controller = new TextEditingController();

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    // final user = FirebaseAuth.instance.currentUser;
    // final userData = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user.uid)
    //     .get();
    // FirebaseFirestore.instance.collection('chat').add({
    //   'Text': _message,
    //   'createdAt': Timestamp.now(),
    //   'userId': user.uid,
    //   'username': userData['username'],
    //   'userImage': userData['image_url'],
    //   'isImage': false,
    // });
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
                        _billDialog(context);
                      }),
                  FlatButton(
                      child: _message.isEmpty ? Text('Pay') : Text('Send'),
                      onPressed:
                          (_message.trim().isEmpty ? () {} : _sendMessage)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _billDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Electicity bill'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Maintenece costs'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Misc costs'),
                ),
              ],
            ),
            actions: <Widget>[
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
