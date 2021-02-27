import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overlay/overlay.dart';

import '../widgets/quoteWidget.dart';
import '../widgets/daily_quote_word.dart';
import '../widgets/hamburger_menu.dart';
import '../widgets/wish_name.dart';
import '../widgets/dashboardGrid.dart';

import '../providers/quotes.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Quotes>(context).getQuotes().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0, backgroundColor: Colors.white, title: const Text('')),
      drawer: HamBurgerMenu(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  WishName(),
                  DailyQuoteWord(),
                  // QuoteWidget(),
                  /* MaterialButton(
                      color: Colors.lightBlueAccent,
                      child: Text('Use Overlay Widget'),
                      // Call CustomOverlay Constructor in on pressed function
                      onPressed: () => CustomOverlay(
                            context: context,
                            // Using overlayWidget
                            overlayWidget: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                      'This widget is passed to the overlay using overlayWidget so there is no close button, but you can always close this overlay by tapping anywhere in the darker areas.'),
                                ),
                              ),
                            ),
                          )
                        ), */
                  DashboardGrid()
                ],
              ),
            ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          child: Image.asset(
            'assets/images/footerLogo_black.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
