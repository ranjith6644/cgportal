import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/add_new_quote_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/forgot_pwd_screen.dart';
import './screens/welcomeScreen.dart';
import './screens/splash_screen.dart';
import './screens/loginScreen.dart';
import './screens/signupScreen.dart';

import './providers/auth.dart';
import './providers/quotes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        // Provider method to pass values from one Provider to Another provider
        ChangeNotifierProxyProvider<Auth, Quotes>(
          create: (ctx) => Quotes(),
          update: (ctx, auth, _) => _..update(auth),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Portal CI',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.lightGreen[400],
            primarySwatch: Colors.lightGreen,
            accentColor: Colors.lightGreen[600],
            fontFamily: 'Roboto',
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      headline6: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.grey[700]),
                  button: TextStyle(color: Colors.white),
                  headline1: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      fontSize: 28,
                      color: Colors.grey[700]),
                ),
          ),
          //home: auth.isAuth ? HomeScreen():AuthScreen(),
          home: auth.isAuth
              ? DashboardScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : WelcomeScreen(),
                ),
          routes: {
            AddNewQuoteScreen.routeName: (ctx) => AddNewQuoteScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
            ForgotPassword.routeName: (ctx) => ForgotPassword(),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (ctx) => DashboardScreen(),
            );
          },
        ),
      ),
    );
  }
}