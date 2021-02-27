import 'package:flutter/material.dart';
import 'package:cgportal/screens/forgot_pwd_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import './signupScreen.dart';
import '../providers/auth.dart';

import '../widgets/colruytLogo.dart';

import '../models/firebaseAuth_exception.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  LoginScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;

  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'userName': '',
  };

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
              _authData['email'] = value.trim();
            },
          ),
        ],
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: true,
            validator: (value) {
              if (value.isEmpty) {
                return 'Fill in Password';
              }
            },
            onSaved: (value) {
              _authData['password'] = value;
            },
          )
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
      await Provider.of<Auth>(context, listen: false).login(
        _authData['email'].trim(),
        _authData['password'],
      );
    } on FirebaseAuthException catch (error) {
      print(error);
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
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
      Navigator.pop(context);
    });
  }

  Widget _submitButton() {
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
            border:
                Border.all(color: Color.fromRGBO(0, 136, 123, 1), width: 0.5),
            color: Color.fromRGBO(0, 136, 123, 1)),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.popAndPushNamed(context, SignUpScreen.routeName);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Sign up',
              style: TextStyle(
                  color: Color.fromRGBO(0, 136, 123, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _emailField(),
        _passwordField(),
      ],
    );
  }

  Widget _forgetPassword() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ForgotPassword.routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.centerRight,
        child: Text('Forgot Password ?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ),
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
                    ColruytLogo(),
                    SizedBox(height: 50),
                    _emailPasswordWidget(),
                    SizedBox(height: 20),
                    _submitButton(),
                    _forgetPassword(),
                    _createAccountLabel(),
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
