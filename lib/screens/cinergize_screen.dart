import 'package:cgportal/widgets/page_under_construction.dart';
import 'package:flutter/material.dart';

class CinergizeScreen extends StatelessWidget {
  static const routeName = '/cinergize';
  const CinergizeScreen({Key key}) : super(key: key);

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
