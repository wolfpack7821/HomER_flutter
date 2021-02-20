import 'package:flutter/material.dart';
import './message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, i) =>  MessageBubble(
                        message: 'Text',
                        isMe: false,
                        username: 'username',
                      ),
                itemCount: 4,
              );      
  }
}