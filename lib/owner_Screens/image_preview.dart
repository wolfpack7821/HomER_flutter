import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  static const id = 'preview';
  @override
  Widget build(BuildContext context) {
    File _image = ModalRoute.of(context).settings.arguments as File;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('ImagePreview'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*.9,
        child: Image.file(_image),
      ),
    );
  }
}
