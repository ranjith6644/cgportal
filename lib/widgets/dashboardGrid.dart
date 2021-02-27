import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white70.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 6.0,
        padding: EdgeInsets.all(10),

        children: List.generate(choices.length, (index) {
          return Center(
            child: SelectCard(choice: choices[index]),
          );
        }),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'HR', icon: Icons.hail),
  const Choice(title: 'Khelruyt', icon: Icons.sports_cricket),
  const Choice(title: 'CISR', icon: Icons.supervisor_account_outlined),
  const Choice(title: 'Templates', icon: Icons.upload_file),
  const Choice(title: 'CInergize', icon: Icons.article_rounded),
  const Choice(title: 'Finance', icon: Icons.account_balance_wallet),
  const Choice(title: 'Utilization', icon: Icons.hourglass_bottom_sharp),
  const Choice(title: 'L&D', icon: Icons.book_rounded),
  const Choice(title: 'More', icon: Icons.more_horiz),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      // When the user taps the button, show a snackbar.
        onTap: () {
          // Scaffold.of(context).showSnackBar(SnackBar(
          //   content: Text('Tap'),
          // ));
        },
        splashColor: Colors.cyanAccent,
        child: Card(
        color: Color.fromRGBO(0, 171, 158, 1).withOpacity(0.5),
        elevation: 5,
        shadowColor: Colors.grey,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Icon(choice.icon, size: 35.0, color: Colors.white)),
                Text(
                  choice.title,
                  style: theme.textTheme.headline6.copyWith(
                      fontSize: 20,
                      color: Colors.white,
                      fontStyle: FontStyle.normal),
                      textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 15,
                )
              ]),

        )));
  }
}
