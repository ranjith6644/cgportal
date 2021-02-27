import 'package:cgportal/screens/add_new_quote_screen.dart';
import 'package:cgportal/screens/dashboard_screen.dart';
import 'package:cgportal/screens/templates_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_new_quote_screen.dart';
import '../providers/auth.dart';

class HamBurgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String userName = Provider
        .of<Auth>(context, listen: false)
        .userName;
    return Drawer(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    AppBar(
                      title: userName == null
                          ? Text('Hello Friend!')
                          : Text('Hello $userName'),
                      automaticallyImplyLeading: false,
                      backgroundColor: Color.fromRGBO(0, 171, 158, 1),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Home'),
                      onTap: () {
                        Navigator.of(context).popAndPushNamed('/');
                        // Navigator.pop(context);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.hail),
                      title: Text('HR'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddNewQuoteScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.sports_cricket),
                      title: Text('Khelruyt'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddNewQuoteScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.supervisor_account_outlined),
                      title: Text('CISR'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddNewQuoteScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.upload_file),
                      title: Text('Templates'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(TemplatesScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.article_rounded),
                      title: Text('CInergize'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddNewQuoteScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.account_balance_wallet),
                      title: Text('Finance'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddNewQuoteScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.hourglass_bottom_sharp),
                      title: Text('Utilization'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddNewQuoteScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.book_rounded),
                      title: Text('L&D'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddNewQuoteScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
                    ),
                    ListTile(
                      leading: Icon(Icons.more_horiz),
                      title: Text('More'),
                      onTap: () {
                        Navigator.of(context)
                            .popAndPushNamed(AddNewQuoteScreen.routeName);
                      },
                    ),
                    Divider(
                      color: Colors.green,
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
              ),
            ),
          );
        },
      ),
    );
  }
}