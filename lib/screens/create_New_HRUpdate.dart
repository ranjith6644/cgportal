import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/hrupdates.dart';
import '../widgets/hamburger_menu.dart';

class CreateNewHRUpdate extends StatefulWidget {
  static const routeName = '/newHREvent';
  @override
  _CreateNewHRUpdateState createState() => _CreateNewHRUpdateState();
}

class _CreateNewHRUpdateState extends State<CreateNewHRUpdate> {
  final _userNameController = TextEditingController();
  final _pwdController = TextEditingController();
  DateTime _selectedDate;

  Future<void> _submitAction() async {
    if (_pwdController.text.isEmpty) {
      return;
    }
    String title = _userNameController.text;
    String description = _pwdController.text;
    if (title.isEmpty) {
      return;
    }
    if (_selectedDate == null) {
      return;
    }
    try {
      await Provider.of<HRUpdates>(context, listen: false)
          .addNewHRUpdate(title, description, _selectedDate);
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

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      labelText: 'Update/Event title',
                      hintText: 'Update/Event title....',
                    ),
                    controller: _userNameController,
                    onSubmitted: (_) {
                      _submitAction();
                    },
                  ),
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'Description of the Event'),
                    controller: _pwdController,
                    onSubmitted: (_) {
                      _submitAction();
                    },
                  ),
                  Container(
                    height: 70,
                    child: Row(
                      children: <Widget>[
                        Text(_selectedDate == null
                            ? 'No Date Chosen'
                            : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}'),
                        Platform.isIOS
                            ? CupertinoButton(
                                onPressed: () {
                                  _presentDatePicker();
                                },
                                child: Text(
                                  'Choose Date',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            : FlatButton(
                                onPressed: () {
                                  _presentDatePicker();
                                },
                                textColor: Theme.of(context).primaryColor,
                                child: Text(
                                  'Choose Date',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _submitAction();
                    },
                    child: Text('Add Event'),
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
