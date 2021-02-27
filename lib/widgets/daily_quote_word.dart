import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';
import '../widgets/todaysQuote.dart';
import '../widgets/quoteWidgetUI.dart';

class DailyQuoteWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    var latestQuote = Provider.of<Quotes>(context).latestQuote;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QuoteWidgetUI(),
        TodaysQuote(),
      ],
    );
  }
}
