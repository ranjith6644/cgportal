import 'package:cgportal/providers/hrupdates.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/archivedHREvents.dart';
import '../widgets/activeHREvents.dart';

class HREventDetailsScreen extends StatelessWidget {
  const HREventDetailsScreen({Key key}) : super(key: key);
  static const routeName = '/hreventDetails';
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
        //drawer: HamBurgerMenu(),
        appBar: AppBar(
      shadowColor: Color.fromRGBO(0, 171, 158, 1),
      backgroundColor: Color.fromRGBO(0, 171, 158, 1),
      title: Text('Event Details'),
    ));
  }
}
