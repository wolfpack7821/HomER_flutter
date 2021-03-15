import 'package:flutter/material.dart';

class NewMessageOwner extends StatefulWidget {
  @override
  _NewMessageOwnerState createState() => _NewMessageOwnerState();
}

class _NewMessageOwnerState extends State<NewMessageOwner> {
  var _message = '';
  final _controller = new TextEditingController();

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
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
                  _message.isEmpty
                      ? FlatButton(
                          child: Text(
                            'Send',
                            style: TextStyle(color: Colors.grey),
                          ),
                          onPressed:
                              (_message.trim().isEmpty ? () {} : _sendMessage),
                        )
                      : FlatButton(
                          child: Text(
                            'Send',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed:
                              (_message.trim().isEmpty ? () {} : _sendMessage),
                        ),
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
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text('Electicity bill'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text('Maintenece costs'),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {});
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
