import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quotes.dart';
import '../widgets/todaysQuote.dart';
import '../widgets/todaysWord.dart';

class DailyQuoteWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white54,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
// <<<<<<< HEAD
            color: Color.fromRGBO(0, 171, 158, 1).withOpacity(0.5),
// =======
//             color: Colors.blue.withOpacity(0.5),
// >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TodaysQuote(),
        TodaysWord(),
      ]),
    );
  }
}
