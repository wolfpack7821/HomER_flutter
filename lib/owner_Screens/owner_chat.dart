import 'package:HomER_flutter/tenant_Screens/complaintPage.dart';
import 'package:HomER_flutter/widgets/owner/new_messageOwner.dart';
import 'package:HomER_flutter/widgets/tenet/messages.dart';
import 'package:flutter/material.dart';

class OwnerChat extends StatefulWidget {
  static const id = 'owner chat';
  @override
  _OwnerChatState createState() => _OwnerChatState();
}

class _OwnerChatState extends State<OwnerChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: Text(
          'Tenet X',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.question_answer_rounded), onPressed: (){
                Navigator.of(context).pushNamed(ComplaintPage.id);
              }),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessageOwner(),
          ],
        ),
      ),
    );
  }
}
