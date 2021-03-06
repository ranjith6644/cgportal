import 'package:cgportal/providers/khelruytupdates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/add_new_quote_screen.dart';
import './screens/utilization_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/forgot_pwd_screen.dart';
import './screens/welcomeScreen.dart';
import './screens/splash_screen.dart';
import './screens/loginScreen.dart';
import './screens/signupScreen.dart';
import './screens/templates_Screen.dart';
import './screens/hr_updates_screen.dart';
import './screens/khelruyt_updates_screen.dart';
import './screens/create_New_HRUpdate.dart';
import './screens/khelruytOverview_screen.dart';
import './screens/cinergize_screen.dart';
import './screens/financeOverview_screen.dart';
import './screens/page_under_construction_screen.dart';
import './screens/add_newdailyWord_screen.dart';

import './providers/auth.dart';
import './providers/quotes.dart';
import './providers/hrupdates.dart';
import './providers/dailyWords.dart';

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
        ChangeNotifierProxyProvider<Auth, HRUpdates>(
          create: (ctx) => HRUpdates(),
          update: (ctx, auth, _) => _..update(auth),
        ),
        ChangeNotifierProxyProvider<Auth, KhelruytUpdates>(
          create: (ctx) => KhelruytUpdates(),
          update: (ctx, auth, _) => _..update(auth),
        ),
        // Provider method to pass values from one Provider to Another provider
        ChangeNotifierProxyProvider<Auth, Quotes>(
          create: (ctx) => Quotes(),
          update: (ctx, auth, _) => _..update(auth),
        ),
        ChangeNotifierProxyProvider<Auth, DailyWords>(
          create: (ctx) => DailyWords(),
          update: (ctx, auth, _) => _..update(auth),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Portal CI',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.cyan[400].withOpacity(1),
            primarySwatch: Colors.cyan,
            accentColor: Color.fromRGBO(0, 124, 145, 0.9),
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
            // '/': (ctx) => DashboardScreen(),
            AddNewQuoteScreen.routeName: (ctx) => AddNewQuoteScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            SignUpScreen.routeName: (ctx) => SignUpScreen(),
            ForgotPassword.routeName: (ctx) => ForgotPassword(),
            PageUnderConstructionScreen.routeName: (ctx) =>
                PageUnderConstructionScreen(),
            TemplatesScreen.routeName: (ctx) => TemplatesScreen(),
            FinanceOverview.routeName: (ctx) => FinanceOverview(),
            KhelruytUpdatesScreen.routeName: (ctx) => KhelruytUpdatesScreen(),
            HRUpdatesScreen.routeName: (ctx) => HRUpdatesScreen(),
            CreateNewHRUpdate.routeName: (ctx) => CreateNewHRUpdate(),
            KhelruytOverviewScreen.routeName: (ctx) => KhelruytOverviewScreen(),
            CinergizeScreen.routeName: (ctx) => CinergizeScreen(),
            AddNewDailyWordScreen.routeName: (ctx) => AddNewDailyWordScreen(),
            UtilizationScreen.routeName: (ctx) => UtilizationScreen(),
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
