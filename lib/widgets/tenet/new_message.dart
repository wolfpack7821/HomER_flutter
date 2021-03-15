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
                  IconButton(icon: Icon(Icons.attach_file), onPressed: () {}),
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
}
