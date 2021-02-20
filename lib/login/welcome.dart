import 'package:flutter/material.dart';
import './loginScreen.dart';

class WelcomePage extends StatelessWidget {
  static const String id = '/WelcomePage';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.purple[800], Colors.purple[400]])),
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Container(
                    //   height: MediaQuery.of(context).size.height * .3,
                    //   child: Image(
                    //     image: AssetImage('assets/images/logo.png'),
                    //   ),
                    // ),
                    SizedBox(height: MediaQuery.of(context).size.height * .25),
                    Padding(
                      child: Text(
                        'Welcome',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 42.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 35.0),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.0),
                      child: Container(
                        height: 50.0,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0))),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.id,
                                  arguments: 'tenet');
                            },
                            child: Text(
                              'Join As Tenet',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow[600]),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .05),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.0),
                      child: Container(
                        height: 50.0,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0))),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.id,
                                  arguments: 'owner');
                            },
                            child: Text(
                              'Join As Owner',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow[600]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
