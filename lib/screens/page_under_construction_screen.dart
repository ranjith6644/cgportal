import 'package:flutter/material.dart';

import '../widgets/page_under_construction.dart';

class PageUnderConstructionScreen extends StatelessWidget {
  const PageUnderConstructionScreen({Key key}) : super(key: key);
  static const routeName = '/pageunderconstruction';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shadowColor: Color.fromRGBO(0, 171, 158, 1),
          backgroundColor: Color.fromRGBO(0, 171, 158, 1),
          title: Text('Work in progress...')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            PageUnderConstruction(),
          ],
        ),
      ),
    );
  }
}
