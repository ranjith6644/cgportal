import 'package:cgportal/models/template.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/templates.dart';
import '../providers/auth.dart';

import '../widgets/hamburger_menu.dart';

class TemplatesScreen extends StatelessWidget {
  static const routeName = '/templates';
  const TemplatesScreen({Key key}) : super(key: key);

//   @override
//   _TemplatesScreenState createState() => _TemplatesScreenState();
// }
//
// class _TemplatesScreenState extends State<TemplatesScreen> {

  // List templates = new Templates().getTemplates();

  @override
  Widget build(BuildContext context) {

    List templates = new Templates().getTemplates();
    return DefaultTabController(
      // home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            shadowColor: Color.fromRGBO(0, 171, 158, 1),
            backgroundColor: Color.fromRGBO(0, 171, 158, 1),
            elevation: 4,
            bottom: TabBar(
              tabs: [
                Tab(text: 'New Requests'),
                Tab(text: 'My Requests'),
              ],
            ),
            title: Text('My Templates'),

          ),
          body: TabBarView(
            children:
              <Widget>[
                Container(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: templates.length,
                    itemBuilder: (BuildContext context, int index) {
                      return makeCard(templates[index]);
                    },
                  ),
                ),
                Center(
                  child: Icon(Icons.youtube_searched_for),
                )
              ],
          ),
        ),
      // ),
    );
  }

  Card makeCard(Template template) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(0, 171, 158, 1)),
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            template.templateName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
    ),
  );
}
