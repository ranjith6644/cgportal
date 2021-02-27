import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class WishName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Auth>(context).userName;
    String wish = '';
    var hour = int.parse(DateFormat('H').format(DateTime.now()));
    if (hour >= 0 && hour < 12) {
      wish = 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      wish = 'Good Afternoon';
    } else {
      wish = 'Good Evening';
    }
    return Container(
     // height: mediaQuery.size.height*0.12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(wish,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 28, fontWeight: FontWeight.normal)),
          Text(name,
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 32))
        ],
      ),
    );
  }
}
