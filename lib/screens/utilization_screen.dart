import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UtilizationScreen extends StatelessWidget {
  static const routeName = '/utilization';
  const UtilizationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Utilization Report'),
      ),
      body: Column(children: <Widget>[
        Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            padding: EdgeInsets.all(10),
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Total Worked Hours \n',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                        text: '1622',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
            )),
        Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(2),
            ),
            padding: EdgeInsets.all(10),
            child: Center(
              child: RichText(
                text: TextSpan(
                    text: 'Total Project Hours \n',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                    children: <TextSpan>[
                      TextSpan(
                        text: '1549',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
            )),
      ]),
    );
  }
}
