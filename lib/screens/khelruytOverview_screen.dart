import 'package:flutter/material.dart';

import '../widgets/khelruytMenu.dart';

class KhelruytOverviewScreen extends StatelessWidget {
  const KhelruytOverviewScreen({Key key}) : super(key: key);
  static const routeName = '/khelruytoverview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Khelruyt')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            KhelruytMenu(),
          ],
        ),
      ),
    );
  }
}
