import 'package:cgportal/providers/hrupdates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/archivedHREvents.dart';
import '../widgets/activeHREvents.dart';
import '../widgets/hamburger_menu.dart';

class HRUpdatesScreen extends StatelessWidget {
  const HRUpdatesScreen({Key key}) : super(key: key);
  static const routeName = '/hrupdates';
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    Provider.of<HRUpdates>(context).fetchAndShowData();
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: HamBurgerMenu(),
          appBar: AppBar(
            title: Text('HR Updates'),
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
                    child: ActiveHREvents()),
              ),
              SingleChildScrollView(
                child: Container(
                    height: mediaQuery.size.height,
                    width: mediaQuery.size.width,
                    child: ArchivedHREvents()),
              ),
            ],
          ),
        ));
  }
}
