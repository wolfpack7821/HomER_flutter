import 'package:HomER_flutter/models/house.dart';
import 'package:HomER_flutter/tenant_Screens/presentHome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchHomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final house = Provider.of<House>(context, listen: false);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  PresentHome.id,
                  arguments: house.houseId
                );
              },
              child: Card(
                elevation: 5,
                child: Column(children: [
                  Image.network(
                    house.houseImage,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                    child: Text(
                      '${house.houseAddress}',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                        child: Text(
                          '${house.houseName}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                        child: Text(
                          'Maintenace:₹${house.houseMaintenance}/month',
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
                            '${house.review}',
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
                            padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                            child: Text(
                              'Rent:₹${house.houseRent}',
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 4),
                            child: Text(
                              'Advance:₹${house.houseAdv}',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
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
        house.isVacant
            ? Positioned(
                top: 0,
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.red,
                  child: Center(
                    child: Text(
                      'Vacant',
                      style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
