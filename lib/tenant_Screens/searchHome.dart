import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/tenet/drawer.dart';
import '../widgets/tenet/searchHome_item.dart';

enum FilterOptions {
  All,
  Acedemics,
  Science,
  Accounts,
  ITandSoftware,
  Design,
  Marketing,
  Photography,
}

class SearchHousePage extends StatefulWidget {
  static const id = 'searchHomePage';
  @override
  _SearchHousePageState createState() => _SearchHousePageState();
}

class _SearchHousePageState extends State<SearchHousePage> {
  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final double itemHeight =
        (MediaQuery.of(context).size.height - kToolbarHeight - 24) * .65;
    final double itemWidth = MediaQuery.of(context).size.width;
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
        centerTitle: true,
        title: Text(
          'Houses',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})
        ],
      ),
      drawer: MainDrawer(),
      body: FutureBuilder(builder: (ctx, snapShots) {
        if (snapShots.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('houses').snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final houseDocs = snapshot.data.docs;
              return houseDocs.length == 0
                  ? Center(
                      child: Image.asset('assets/waiting.png',
                          height: MediaQuery.of(context).size.height * .7))
                  : GridView.builder(
                      itemBuilder: (ctx, i) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SearchHomeItem(houseDocs[i].id),
                      ),
                      itemCount: houseDocs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: itemWidth / itemHeight,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 5,
                      ),
                    );
            });
      }),
    );
  }
}
