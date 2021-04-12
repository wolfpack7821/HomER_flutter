import 'package:flutter/material.dart';

class DetailsField extends StatefulWidget {
  final title;
  final value;
  DetailsField(this.title, this.value);

  @override
  _DetailsFieldState createState() => _DetailsFieldState();
}

class _DetailsFieldState extends State<DetailsField> {
  bool isEdit = false;
  String editValue;

  @override
  Widget build(BuildContext context) {
    var title = widget.title;
    var value = widget.value;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '$title -',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ]),
            Text('$value',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                    color: Colors.grey),),
            SizedBox(height: 30)
          ]),
    );
  }
}
