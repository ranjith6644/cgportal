import 'package:flutter/material.dart';

class ColruytLogo extends StatelessWidget {
  const ColruytLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Image.asset(
        'assets/images/mainLogo_black.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
