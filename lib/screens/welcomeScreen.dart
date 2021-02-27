import 'package:flutter/material.dart';

import './loginScreen.dart';
import './signupScreen.dart';

import '../widgets/colruytLogo.dart';
import '../widgets/main_title.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key, this.title}) : super(key: key);

  static const routeName = '/welcomescreen';
  final String title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget _loginButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(LoginScreen.routeName);
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

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Color.fromRGBO(0, 171, 158, 1), width: 1),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 171, 158, 1)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ColruytLogo(),
                  MainTitle(),
                  SizedBox(
                    height: 80,
                  ),
                  _loginButton(),
                  SizedBox(
                    height: 20,
                  ),
                  _signUpButton(),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
