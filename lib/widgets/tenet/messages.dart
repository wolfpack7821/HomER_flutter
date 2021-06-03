import 'package:flutter/material.dart';
import '../message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
        future:
            FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
        builder: (ctx, snapShots) {
          if (snapShots.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chat${snapShots.data['house']}')
                  .orderBy('createdAt', descending: true)
                  .snapshots(),
              builder: (ctx, chatSnapshot) {
                if (chatSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final chatDocs = chatSnapshot.data.docs;
                return ListView.builder(
                  reverse: true,
                  itemBuilder: (context, i) => chatDocs[i]['isPay']==0
                      ? MessageBubble(
                          message: chatDocs[i]['Text'],
                          isMe: chatDocs[i]['userId'] == user.uid,
                          key: ValueKey(
                            chatDocs[i].id,
                          ),
                          username: chatDocs[i]['username'],
                        )
                      :  MessageBubble(
                      message: chatDocs[i]['Text'],
                      isMe: chatDocs[i]['userId'] == user.uid,
                      key: ValueKey(
                        chatDocs[i].id,
                      ),
                      value: chatDocs[i]['value'],
                      username: chatDocs[i]['username'],
                      isPay: chatDocs[i]['isPay'],
                    ),
                  itemCount: chatDocs.length,
                );
              });
        });
  }
}
