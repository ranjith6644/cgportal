// <<<<<<< HEAD
import 'dart:io';

// =======
import 'package:cgportal/screens/cinergize_screen.dart';
import 'package:cgportal/screens/financeOverview_screen.dart';
import 'package:cgportal/screens/hr_updates_screen.dart';
import 'package:cgportal/screens/khelruytOverview_screen.dart';
import 'package:cgportal/screens/page_under_construction_screen.dart';
import 'package:cgportal/screens/templates_Screen.dart';
// >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
// <<<<<<< HEAD
      padding: EdgeInsets.all(10),
// =======
      margin: EdgeInsets.only(bottom: 10, top: 1, left: 10, right: 10),
// >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
// <<<<<<< HEAD
            color: Colors.white70.withOpacity(0.5),
// =======
//             color: Colors.orange[400].withOpacity(0.5),
// >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
// <<<<<<< HEAD
// =======
//       padding: EdgeInsets.all(5),
// >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
      child: GridView.count(
        crossAxisCount: 3,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
// <<<<<<< HEAD
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 6.0,
        padding: EdgeInsets.all(10),

// =======
//         crossAxisSpacing: 2.0,
//         mainAxisSpacing: 1.0,
// >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
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
// <<<<<<< HEAD
//   const Choice(title: 'HR', icon: Icons.hail),
//   const Choice(title: 'Khelruyt', icon: Icons.sports_cricket),
//   const Choice(title: 'CISR', icon: Icons.supervisor_account_outlined),
//   const Choice(title: 'Templates', icon: Icons.upload_file),
//   const Choice(title: 'CInergize', icon: Icons.article_rounded),
//   const Choice(title: 'Finance', icon: Icons.account_balance_wallet),
//   const Choice(title: 'Utilization', icon: Icons.hourglass_bottom_sharp),
//   const Choice(title: 'L&D', icon: Icons.book_rounded),
//   const Choice(title: 'More', icon: Icons.more_horiz),
// =======
  const Choice(
      title: 'HR', icon: Icons.hail, navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: 'Khelruyt',
      icon: Icons.sports_cricket,
      navigation: KhelruytOverviewScreen.routeName),
  const Choice(
      title: 'CISR',
      icon: Icons.supervisor_account_outlined,
      navigation: HRUpdatesScreen.routeName),
  const Choice(
      title: 'Finance',
      icon: Icons.account_balance_wallet,
      navigation: FinanceOverview.routeName),
  const Choice(
      title: 'Templates',
      icon: Icons.upload_file,
      navigation: TemplatesScreen.routeName),
  const Choice(
      title: 'CInergize',
      icon: Icons.article_rounded,
      navigation: CinergizeScreen.routeName),
  const Choice(
      title: 'L&D',
      icon: Icons.book_rounded,
      navigation: PageUnderConstructionScreen.routeName),
  const Choice(
      title: 'Utilization',
      icon: Icons.hourglass_bottom_sharp,
      navigation: PageUnderConstructionScreen.routeName),
  const Choice(
      title: 'More',
      icon: Icons.more_horiz,
      navigation: PageUnderConstructionScreen.routeName),
// >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
// <<<<<<< HEAD
        // When the user taps the button, show a snackbar.
        onTap: () {
          // Scaffold.of(context).showSnackBar(SnackBar(
          //   content: Text('Tap'),
          // ));
          Navigator.of(context).pushNamed('${choice.navigation}');
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
                        child:
                            Icon(choice.icon, size: 35.0, color: Colors.white)),
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
// =======
//       onTap: () {
//         Navigator.of(context).pushNamed('${choice.navigation}');
//       },
//       child: Container(
//         height: 100,
//         width: 100,
//         child: Card(
//           color: Color.fromRGBO(242, 242, 242, 1),
//           child: Center(
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   // Expanded(child: Icon(choice.icon, size: 35.0, color: Colors.grey)),
//                   Text(
//                     choice.title,
//                     style: theme.textTheme.headline6.copyWith(
//                         fontSize: 20,
//                         // color: Color.fromRGBO(0, 171, 158, 1),
//                         color: Colors.black54,
//                         fontStyle: FontStyle.normal),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 2,
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
// >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
  }
}
