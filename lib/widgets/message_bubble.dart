import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final Key key;
  final String message;
  final isMe;
  final String username;
  MessageBubble(
      {this.key,this.message, this.isMe, this.username});
  @override
  Widget build(BuildContext context) {
    return message != ''
        ? Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: isMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 180),
                          child: Container(
                            decoration: BoxDecoration(
                              color: isMe ? Colors.amber : Colors.deepPurple,
                              borderRadius: isMe
                                  ? BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      bottomLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    )
                                  : BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      topRight: Radius.circular(16),
                                    ),
                            ),
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Column(
                              crossAxisAlignment: isMe
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                              children: [
                                Text(
                                  message,
                                  style: TextStyle(
                                    color: isMe ? Colors.black : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  overflow: Overflow.visible,
                ),
              ],
            ),
          )
        : Container();
  }
}
