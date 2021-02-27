import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';

import '../widgets/emptyQuote.dart';
import '../widgets/todaysQuote.dart';

class QuoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var latestQuote = Provider.of<Quotes>(context).latestQuote;
    return latestQuote.isEmpty ? EmptyQuote() : TodaysQuote();
  }
}
