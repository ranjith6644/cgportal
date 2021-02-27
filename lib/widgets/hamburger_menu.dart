import 'package:cgportal/screens/add_new_quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_new_quote_screen.dart';

import '../screens/create_New_HRUpdate.dart';

import '../providers/auth.dart';

class HamBurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String userName = Provider.of<Auth>(context, listen: false).userName;
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
      shadowColor: Color.fromRGBO(0, 171, 158, 1),
        backgroundColor: Color.fromRGBO(0, 171, 158, 1),
            title: userName == null
                ? Text('Hello Friend!')
                : Text('Hello $userName'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(
            color: Color.fromRGBO(0, 171, 158, 1),
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Add Quote'),
            onTap: () {
              Navigator.of(context)
                  .popAndPushNamed(AddNewQuoteScreen.routeName);
            },
          ),
          Divider(
            color: Color.fromRGBO(0, 171, 158, 1),
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('New HRUpdates'),
            onTap: () {
              Navigator.of(context)
                  .popAndPushNamed(CreateNewHRUpdate.routeName);
            },
          ),
          Divider(
            color: Color.fromRGBO(0, 171, 158, 1),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
