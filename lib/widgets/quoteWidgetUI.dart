import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';

class QuoteWidgetUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    var latestQuote = Provider.of<Quotes>(context).latestQuote;
    return Container(
        // height: mediaQuery.size.height*0.22,
        height: 130,
        width: mediaQuery.size.width / 3,
        padding: EdgeInsets.only(left: 5, bottom: 5, top: 15),
        margin: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white54,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.lightGreen[200].withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Image.asset(
          'assets/images/quote_day.png',
          fit: BoxFit.cover,
        ));
  }
}
