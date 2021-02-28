import 'package:cgportal/providers/khelruytupdates.dart';

import 'package:cgportal/widgets/activeKhelruytEvents.dart';
import 'package:cgportal/widgets/archivedKhelruytEvents.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class KhelruytUpdatesScreen extends StatelessWidget {
  const KhelruytUpdatesScreen({Key key}) : super(key: key);
  static const routeName = '/khelruytupdates';
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            shadowColor: Color.fromRGBO(0, 171, 158, 1),
            backgroundColor: Color.fromRGBO(0, 171, 158, 1),
            title: Text('Khelruyt Updates'),
            bottom: TabBar(
              unselectedLabelStyle: TextStyle(fontStyle: FontStyle.italic),
              indicatorColor: Colors.grey[900],
              labelColor: Colors.white,
              tabs: <Widget>[
                Tab(
                  text: 'Upcoming',
                ),
                Tab(text: 'Archived'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                    height: mediaQuery.size.height,
                    width: mediaQuery.size.width,
                    child: ActiveKhelruytEvents()),
              ),
              SingleChildScrollView(
                child: Container(
                    height: mediaQuery.size.height,
                    width: mediaQuery.size.width,
                    child: ArchivedKhelruytEvents()),
              ),
            ],
          ),
        ));
  }
}
