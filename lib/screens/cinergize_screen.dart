import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CinergizeScreen extends StatelessWidget {
  static const routeName = '/cinergize';
  const CinergizeScreen({Key key}) : super(key: key);

  static const imgList = [
    'https://miro.medium.com/max/1024/1*92OdlxNqI3iChI5kNl1MFg.jpeg',
    'https://ebsedu.org/wp-content/uploads/2020/06/AI-CAREER.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Color.fromRGBO(0, 171, 158, 1),
        backgroundColor: Color.fromRGBO(0, 171, 158, 1),
        elevation: 4,
        title: Text('Cinergize'),
      ),
      body: Container(
          height: 250,
          padding: EdgeInsets.all(10),
          child: CarouselSlider(
            options: CarouselOptions(height: 400.0),
            items: imgList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // decoration: BoxDecoration(
                      //     color: Colors.amber
                      // ),
                      child: Image.network(
                        i,
                        fit: BoxFit.cover,
                        width: 1000,
                      ));
                },
              );
            }).toList(),
          )),
    );
  }
}
