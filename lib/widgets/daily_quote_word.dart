import 'package:flutter/material.dart';

import '../widgets/todaysQuote.dart';
import '../widgets/todaysWord.dart';

import 'package:carousel_slider/carousel_slider.dart';

class DailyQuoteWord extends StatelessWidget {
  /* @override
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
            // color: Colors.blue.withOpacity(0.5),
// // >>>>>>> 14761b7226651d7d05b665862d48a43348e922c1
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
  } */

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        CarouselSlider(
            // options: CarouselOptions(height: 400.0),
            items: [TodaysQuote(), TodaysWord()].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      padding: EdgeInsets.only(top: 10.0),
                      // decoration: BoxDecoration(
                      //     color: Colors.amber
                      // ),
                      child: i);
                },
              );
            }).toList(),
            // carouselController: DailyQuoteWord,
            options: CarouselOptions(
              height: 200,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            )),
      ]);
}
