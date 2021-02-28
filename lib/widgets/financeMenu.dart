import 'package:flutter/material.dart';

import '../screens/page_under_construction_screen.dart';

class FinanceMenu extends StatelessWidget {
  const FinanceMenu({Key key}) : super(key: key);

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
      title: 'Updates',
      icon: Icons.announcement,
      navigation: PageUnderConstructionScreen.routeName),
  const Choice(
      title: 'Form-16',
      icon: Icons.file_copy,
      navigation: PageUnderConstructionScreen.routeName),
  const Choice(
      title: 'Upload',
      icon: Icons.upload_file,
      navigation: PageUnderConstructionScreen.routeName),
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
  }
}
