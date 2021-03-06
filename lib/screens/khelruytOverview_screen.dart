import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/khelruytMenu.dart';
import '../providers/khelruytupdates.dart';

class KhelruytOverviewScreen extends StatelessWidget {
  const KhelruytOverviewScreen({Key key}) : super(key: key);
  static const routeName = '/khelruytoverview';
  @override
  Widget build(BuildContext context) {
    Provider.of<KhelruytUpdates>(context).fetchAndShowData();
    return Scaffold(
      appBar: AppBar(
          shadowColor: Color.fromRGBO(0, 171, 158, 1),
          backgroundColor: Color.fromRGBO(0, 171, 158, 1),
          title: Text('Khelruyt')),
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
