import 'package:flutter/material.dart';

class EmptyQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: 130,
      width: mediaQuery.size.width,
      padding: EdgeInsets.all(10),
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
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Quote of the Day...!!! \n',
              style: theme.textTheme.headline6
                  .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'If there is no struggle then there is no progress',
              style: theme.textTheme.headline6
                  .copyWith(fontSize: 28, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
