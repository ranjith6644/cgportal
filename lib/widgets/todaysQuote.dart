import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';

class TodaysQuote extends StatelessWidget {
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
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Quote of the Day...!!! \n',
              style: theme.textTheme.headline6.copyWith(
                  fontSize: 22,
                  color: Color.fromRGBO(66, 67, 72, 1),
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: '"$latestQuote"',
              style: theme.textTheme.headline6.copyWith(
                  fontSize: 24,
                  color: Color.fromRGBO(102, 103, 109, 1),
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
