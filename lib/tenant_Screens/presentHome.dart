// import 'package:HomER_flutter/widgets/tenet/details_field.dart';
import 'package:HomER_flutter/models/house.dart';
import 'package:HomER_flutter/widgets/tenet/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class PresentHome extends StatefulWidget {
  static const id = 'PresentHome';
  @override
  _PresentHomeState createState() => _PresentHomeState();
}

class _PresentHomeState extends State<PresentHome> {
  Widget filledStar() {
    return Icon(
      Icons.star,
      color: Colors.black,
      size: 15,
    );
  }
 Widget fields(String field, value) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 5),
          child: Text(
            '$field:',
            style: TextStyle(
                color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 5),
          child: Text(
            '$value',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
            ),
          ),
        ),
      ],
    );
  }
  Widget filledBar(Color color, int flex1, var width) {
    return Container(
      width: width * 0.27,
      height: 8,
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: flex1,
            child: Container(
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Expanded(
            flex: 10 - flex1,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            ),
          )
        ],
      ),
    );
  }

  Widget ratingReviewRightRow(
      String stars, Color color, int flex, int count, var width) {
    return Row(
      children: <Widget>[
        Text(
          stars + ' ',
          style: TextStyle(fontFamily: '', fontSize: 14),
        ),
        Icon(
          Icons.star,
          size: 10,
        ),
        SizedBox(
          width: 4,
        ),
        filledBar(color, flex, width),
        Text(
          ' ' + count.toString(),
          style: TextStyle(fontFamily: '', fontSize: 16),
        )
      ],
    );
  }

  Widget emptyStar() {
    return Icon(
      Icons.star_border,
      size: 19,
    );
  }

  Widget halfFilledStar() {
    return Icon(
      Icons.star_half,
      size: 15,
    );
  }

  Widget ratingReviewRight(var width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ratingReviewRightRow('5', Colors.green, 9, 4321, width * .8),
        ratingReviewRightRow('4', Colors.green, 8, 3321, width * .8),
        ratingReviewRightRow('3', Colors.green, 3, 1321, width * .8),
        ratingReviewRightRow('2', Colors.yellow, 2, 821, width * .8),
        ratingReviewRightRow('1', Colors.yellow, 1, 321, width * .8),
      ],
    );
  }

  Widget variableStars(var review) {
    if (review is String) review = double.parse(review);
    int temp = review.toInt();
    return Row(
      children: <Widget>[
        for (var i = 1; i <= temp; i++) filledStar(),
        if ((review - temp) > 0) halfFilledStar(),
        if ((review - temp) > 0)
          for (int i = temp + 1; i < 5; i++) emptyStar(),
        if (review - temp == 0)
          for (int i = temp; i < 5; i++) emptyStar(),
      ],
    );
  }

  Widget ratingReviewleft(
    String rating,
    String ratingCount,
    String reviewCount,
    var width,
    double marginLeft,
    double marginRight,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          rating,
          style: TextStyle(
              fontFamily: '', fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          width: width, //size.width * 0.5,
          margin: EdgeInsets.only(
            left: marginLeft, //size.width * 0.12,
            right: marginRight, //size.width * 0.12,
          ),
          child: variableStars(rating == null ? 0.0 : rating),
        ),
        Text(
          ratingCount + ' ratings &',
          style: TextStyle(fontFamily: '', fontSize: 15),
        ),
        Text(
          reviewCount + ' reviews',
          style: TextStyle(fontFamily: '', fontSize: 15),
        )
      ],
    );
  }

  Widget reviewText(int stars, String type, String reviwText, String author,
      String reviewDate) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 20,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      stars.toString(),
                      style: TextStyle(fontFamily: ''),
                    ),
                    filledStar()
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                type,
                style: TextStyle(fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(
            reviwText,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 10),
          Text(
            author,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Text(
            reviewDate,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Divider(
            height: 16,
            thickness: 0.3,
            color: Colors.black,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final houseId = ModalRoute.of(context).settings.arguments as String;
    print(houseId);

    final loadedHouse = Provider.of<Houses>(
      context,
      listen: false,
    ).findById(houseId);
    return Scaffold(
        key: _scaffoldKey,
        drawer: MainDrawer(),
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
          title: Text(
            'House Details',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: FutureBuilder(
            future: loadedHouse,
            builder: (ctx, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 1, 12, 1),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          height: 300,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Image.network(
                                      snapshot.data.houseImage),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Image.network(
                                      snapshot.data.houseImage),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Image.network(
                                      snapshot.data.houseImage),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data.houseId == ''
                            ? 'Lotas Apparments Banglore /403'
                            : snapshot.data.houseName,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40.0, 5, 0, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 50,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data.houseAddress,
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                    fields('Rent', '₹${snapshot.data.houseRent}'),
                  fields('Advance', '₹${snapshot.data.houseAdv}'),
                  fields('Owner', '${snapshot.data.ownerId}'),
                  fields('Owner ContactNo', '${snapshot.data.contactNO}'),
                  fields('Menitenance Details',
                      '₹${snapshot.data.houseMaintenance}'),
                  fields('TenetName', '${snapshot.data.tenantName}'),
                  fields('No Of Members', '4'),
                    SizedBox(height: MediaQuery.of(context).size.height * .05),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width -
                          40, //size.width - 40,
                      color: Colors.grey[350],
                      padding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Reviews and Ratings',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: 130,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: ratingReviewleft(
                                '4',
                                '567',
                                '4,567',
                                MediaQuery.of(context).size.width * 0.5,
                                MediaQuery.of(context).size.width * 0.12,
                                MediaQuery.of(context).size.width * 0.12),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: ratingReviewRight(
                                  MediaQuery.of(context).size.width),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .9,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Write a review..."),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    reviewText(4, 'good', 'reviewText', 'author', 'reviewDate'),
                    reviewText(4, 'good', 'reviewText', 'author', 'reviewDate')
                  ],
                ),
              );
            }));
  }
}
