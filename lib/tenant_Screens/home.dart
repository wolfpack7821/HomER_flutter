import 'package:HomER_flutter/widgets/tenet/messages.dart';
import 'package:HomER_flutter/widgets/tenet/new_message.dart';
import 'package:flutter/material.dart';
import '../widgets/tenet/drawer.dart';

class TenetHome extends StatefulWidget {
  static const id = 'tenet home';
  @override
  _TenetHomeState createState() => _TenetHomeState();
}

class _TenetHomeState extends State<TenetHome> {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_open,
            color: Colors.purple,
            size: 32,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: Text(
          'OWNER X',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          FlatButton(
            onPressed: (){},
            child: Text('Vacat'),
          ),
          IconButton(
              icon: Icon(Icons.question_answer_rounded), onPressed: (){}),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
