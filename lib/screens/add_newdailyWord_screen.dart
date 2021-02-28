import 'package:cgportal/providers/dailyWords.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dailyWords.dart';
import '../providers/auth.dart';

import '../widgets/hamburger_menu.dart';

class AddNewDailyWordScreen extends StatefulWidget {
  AddNewDailyWordScreen({Key key}) : super(key: key);
  static const routeName = '/newword';
  @override
  _AddNewDailyWordScreenState createState() => _AddNewDailyWordScreenState();
}

class _AddNewDailyWordScreenState extends State<AddNewDailyWordScreen> {
  final _userNameController = TextEditingController();
  final _pwdController = TextEditingController();
  Future<void> _submitAction(name) async {
    if (_pwdController.text.isEmpty) {
      return;
    }
    String word = _userNameController.text;
    String meaning = _pwdController.text;
    if (word.isEmpty) {
      return;
    }

    try {
      await Provider.of<DailyWords>(context, listen: false)
          .addNewDailyWord(name, word, meaning);
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred!'),
          content: Text('Something went wrong. $error'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    } finally {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var name = Provider.of<Auth>(context).userName;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Color.fromRGBO(0, 171, 158, 1),
        backgroundColor: Color.fromRGBO(0, 171, 158, 1),
        title: Text('Add New Entry'),
      ),
      drawer: HamBurgerMenu(),
      body: SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Container(
              padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'word',
                      hintText: 'word',
                    ),
                    controller: _userNameController,
                    onSubmitted: (_) {
                      _submitAction(name);
                    },
                  ),
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'Meaning of the word'),
                    controller: _pwdController,
                    onSubmitted: (_) {
                      _submitAction(name);
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      _submitAction(name);
                    },
                    child: Text('Add Word'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
