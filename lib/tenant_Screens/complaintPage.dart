import 'package:flutter/material.dart';

class ComplaintPage extends StatefulWidget {
  static const id = 'complaintPage';

  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  // var _initValues = {
  //   'title': '',
  //   'description': '',
  //   'price': '',
  //   'imageUrl': '',
  // };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(  
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 25),
                  Container(
                    color: Colors.yellow[600],
                    height: 28,
                    width: 8,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Get In ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  Text(
                    'Touch',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Tell you\'re owner what to improve ',
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Your Name', focusColor: Colors.purple[900]),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Your Email Address',
                      focusColor: Colors.purple[900]),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Your Phone Number',
                      focusColor: Colors.purple[900]),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Subject', focusColor: Colors.purple[900]),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      hintText: 'Type Message Here...',
                      focusColor: Colors.purple[900]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: FlatButton.icon(
                  icon: Icon(
                    Icons.photo_camera,
                    size: 60,
                    color: Colors.deepPurple,
                  ),
                  label: Text('Select picture here'),
                  textColor: Colors.deepPurple,
                  onPressed: () async {
                    // pickImage();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      child: RaisedButton(
                          color: Colors.yellow[700],
                          onPressed: () {},
                          child: Text('Send')),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
