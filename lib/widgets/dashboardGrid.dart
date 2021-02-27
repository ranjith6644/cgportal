import 'package:cgportal/screens/hr_updates_screen.dart';
import 'package:cgportal/screens/khelruytOverview_screen.dart';
import 'package:cgportal/screens/khelruyt_updates_screen.dart';
import 'package:flutter/material.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 1, left: 10, right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.orange[400].withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(5),
      child: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 1.0,
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
  const Choice({this.title, this.icon, this.navigation});
  final String title;
  final IconData icon;
  final String navigation;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'HR Updates',
      //  icon: Icons.home,
      navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: 'Khelruyt',
      //  icon: Icons.sports_cricket,
      navigation: KhelruytOverviewScreen.routeName),
  const Choice(
      title: 'CISR Activities',
      //  icon: Icons.contacts,
      navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: 'Finance Updates',
      // icon: Icons.money,
      navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: '',
      //icon: Icons.phone,
      navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: 'News',
      //  icon: Icons.camera_alt,
      navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: 'WFH Request',
      //  icon: Icons.settings,
      navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: 'Worked Hours',
      //   icon: Icons.photo_album,
      navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: 'More',
      // icon: Icons.wifi,
      navigation: HRUpdatesScreen.routeName),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('${choice.navigation}');
      },
      child: Container(
        height: 100,
        width: 100,
        child: Card(
          color: Color.fromRGBO(242, 242, 242, 1),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Expanded(child: Icon(choice.icon, size: 35.0, color: Colors.grey)),
                  Text(
                    choice.title,
                    style: theme.textTheme.headline6.copyWith(
                        fontSize: 20,
                        // color: Color.fromRGBO(0, 171, 158, 1),
                        color: Colors.black54,
                        fontStyle: FontStyle.normal),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
