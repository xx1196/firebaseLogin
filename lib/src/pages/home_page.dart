import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      title: Text('Home page'),
    );
    return Scaffold(
      appBar: appBar,
    );
  }
}
