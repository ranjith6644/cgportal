import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overlay/overlay.dart';

import '../providers/quotes.dart';

class TodaysWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var latestQuote = Provider.of<Quotes>(context).latestQuote;
    return InkWell(
        onTap: () {
          CustomOverlay(
              context: context,
              // Using overlayWidget
              overlayWidget: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('"$latestQuote"',
                          style: theme.textTheme.headline6.copyWith(
                              fontSize: 20,
                              color: Color.fromRGBO(0, 171, 158, 1),
                              fontStyle: FontStyle.italic)),
                    ),
                  )));
        },
        child: Container(
            height: 140,
            width: 170,
            child: Card(
                margin: EdgeInsets.all(10),
                color: Color.fromRGBO(242, 242, 242, 1),
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/word_day_final.png',
                      fit: BoxFit.fitWidth,
                    )))));
  }
}