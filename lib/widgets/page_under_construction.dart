import 'package:flutter/material.dart';

class PageUnderConstruction extends StatelessWidget {
  const PageUnderConstruction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(50),
        alignment: Alignment.topCenter,
        height: 500,
        padding: EdgeInsets.all(10),
        child: Image.asset(
          'assets/images/Page_Under_Construction.png',
          fit: BoxFit.fitWidth,
        ));
  }
}
