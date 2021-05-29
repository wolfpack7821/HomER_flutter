import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'building_item.dart';

class BuildingsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;


    return FutureBuilder(builder: (ctx, snapShots) {
      if (snapShots.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }
      return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('building')
              .doc(user.uid)
              .collection('building${user.uid}')
              .snapshots(),
          builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final buildDocs = snapshot.data.docs;

            return GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: buildDocs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 5 / 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (ctx, i) => BuildingItem(
                buildId: buildDocs[i].id,
                buildAddress: buildDocs[i]['buildAddress'],
                maintenence: buildDocs[i]['maintenence'],
                houses: buildDocs[i]['houses'] as List,
                buildName: buildDocs[i]['buildName'],
                isHome: buildDocs[i]['isHome'],
              ),
            );
          });
    });
  }
}