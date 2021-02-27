import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/http_exception.dart';

import '../providers/auth.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = '/forgotpwd';
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  var email;

  Widget _emailField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email Id',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty || !value.contains('@')) {
                return 'Invalid email!';
              }
            },
            onSaved: (value) {
              email = value.trim();
            },
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred...!'),
        content: Text(message),
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
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    // Login
    try {
      await Provider.of<Auth>(context, listen: false).resetPassword(email);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('ERROR_EMAIL_ALREADY_IN_USE')) {
        errorMessage = 'Email-id is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'Not a valid email id';
      } else if (error.toString().contains('ERROR_USER_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('ERROR_WRONG_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not send reset link. Please try again later.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
      Navigator.pop(context);
    });
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _resetButton() {
    return GestureDetector(
      onTap: () {
        _submit();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          border: Border.all(color: Color.fromRGBO(0, 136, 123, 1), width: 0.5),
          color: Color.fromRGBO(0, 136, 123, 1),
        ),
        child: Text(
          'Send Reset Link',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Employee ',
          style: TextStyle(
              color: Color.fromRGBO(102, 103, 109, 1),
              fontSize: 40,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: 'Portal',
              style: TextStyle(
                  color: Color.fromRGBO(102, 103, 109, 1), fontSize: 40),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(height: 50),
                    _emailField(),
                    SizedBox(height: 20),
                    _resetButton(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    ));
  }
}
