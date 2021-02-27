import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';
import '../providers/auth.dart';

import '../widgets/hamburger_menu.dart';

class AddNewQuoteScreen extends StatefulWidget {
  static const routeName = '/newquote';
  @override
  _AddNewQuoteScreenState createState() => _AddNewQuoteScreenState();
}

class _AddNewQuoteScreenState extends State<AddNewQuoteScreen> {
  final _quoteDetail = TextEditingController();

  Future<void> _submitAction(name) async {
    if (_quoteDetail.text.isEmpty) {
      return;
    }
    var timestamp = DateTime.now();
    //  var id = DateTime.now().toIso8601String();
    // String quoteId = id;
    DateTime createdDate = timestamp;

    try {
      await Provider.of<Quotes>(context, listen: false)
          .addNewQuote(name, _quoteDetail.text, createdDate);
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
        title: Text('Add New Quote'),
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
                    decoration: InputDecoration(labelText: 'Add new quote...'),
                    controller: _quoteDetail,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    // _ in bracket is to Indicate we don't use the param
                    onSubmitted: (_) {
                      _submitAction(name);
                    },
                  ),
                  RaisedButton(
                    onPressed: () {
                      _submitAction(name);
                    },
                    child: Text('Add Quote'),
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
