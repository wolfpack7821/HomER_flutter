import 'package:HomER_flutter/tenant_Screens/complaintPage.dart';
import 'package:HomER_flutter/widgets/owner/messagesOwner.dart';
import 'package:HomER_flutter/widgets/owner/new_messageOwner.dart';
import 'package:flutter/material.dart';

class OwnerChat extends StatefulWidget {
  static const id = 'owner chat';
  @override
  _OwnerChatState createState() => _OwnerChatState();
}

class _OwnerChatState extends State<OwnerChat> {
  @override
  Widget build(BuildContext context) {
    final hId =ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
              child: MessagesOwner(hId),
            ),
            NewMessageOwner(hId),
          ],
        ),
      ),
    );
  }
}
