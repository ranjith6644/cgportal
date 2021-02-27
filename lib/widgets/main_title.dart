import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(15.0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Employee ',
              style: TextStyle(
                  color: Color.fromRGBO(102, 103, 109, 1),
                  fontSize: 40,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: 'Portal',
                  style: TextStyle(
                      color: Color.fromRGBO(102, 103, 109, 1), fontSize: 40),
                ),
              ]),
        ));
  }
}
