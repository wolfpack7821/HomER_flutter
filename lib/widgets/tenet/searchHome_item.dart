import 'package:HomER_flutter/models/house.dart';
import 'package:HomER_flutter/tenant_Screens/searchHomeDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchHomeItem extends StatelessWidget {
  final String id;
  SearchHomeItem(this.id);
  @override
  Widget build(BuildContext context) {
    final house = Provider.of<Houses>(context, listen: false).findById(id);
    return FutureBuilder(
      future: house,
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SearchHomeDetailsPage.id,
                        arguments: snapshot.data.houseId);
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(children: [
                      Image.network(
                        snapshot.data.houseImage,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                        child: Text(
                          '${snapshot.data.houseAddress}',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                            child: Text(
                              '${snapshot.data.houseName}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                            child: Text(
                              'Maintenace:₹${snapshot.data.houseMaintenance}/month',
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .7,
                        child: Divider(color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Reviews',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${snapshot.data.review}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.star),
                                  SizedBox(width: 2),
                                  Icon(Icons.star),
                                  SizedBox(width: 2),
                                  Icon(Icons.star),
                                  SizedBox(width: 2),
                                  Icon(Icons.star_border),
                                  SizedBox(width: 2),
                                  Icon(Icons.star_border),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * .1,
                            child: VerticalDivider(
                              color: Colors.grey,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                                child: Text(
                                  'Rent:₹${snapshot.data.houseRent}',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                                child: Text(
                                  'Advance:₹${snapshot.data.houseAdv}',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            ),
            snapshot.data.isVacant
                ? Positioned(
                    top: 0,
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Vacant',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
