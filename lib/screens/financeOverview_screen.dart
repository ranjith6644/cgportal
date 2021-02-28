import 'package:flutter/material.dart';

import '../widgets/financeMenu.dart';

class FinanceOverview extends StatelessWidget {
  const FinanceOverview({Key key}) : super(key: key);
  static const routeName = '/financeoverview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shadowColor: Color.fromRGBO(0, 171, 158, 1),
          backgroundColor: Color.fromRGBO(0, 171, 158, 1),
          title: Text('Finance')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            FinanceMenu(),
          ],
        ),
      ),
    );
  }
}
