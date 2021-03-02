import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/hamburger_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CinergizeScreen extends StatelessWidget {
  static const routeName = '/cinergize';
  const CinergizeScreen({Key key}) : super(key: key);

  static const imgList = [
    'https://miro.medium.com/max/1024/1*92OdlxNqI3iChI5kNl1MFg.jpeg',
    'https://ebsedu.org/wp-content/uploads/2020/06/AI-CAREER.jpg'
  ];

  static const articlesList = [
    'Internet of Things',
    'Application monitoring with Artificial Intelligence',
    'Parenting version 2.0',
    'A Mental Trick to Make Any Task Less Intimidating',
    'Bitcoin is Dead: Everything You Need to Know About Crypto in 2021'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Color.fromRGBO(0, 171, 158, 1),
          backgroundColor: Color.fromRGBO(0, 171, 158, 1),
          elevation: 4,
          title: Text('CInergize'),
        ),
        body: ListView(children: <Widget>[
          Container(
            height: 50,
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: FractionalOffset(0.1, 0.6),
              child: Text(
                'Top Viewed on CInergize',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          Container(
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
          Container(
            height: 50,
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: FractionalOffset(0.1, 0.6),
              child: Text(
                'Popular on CInergize',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: articlesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 8.0,
                  margin:
                      new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(Icons.star, color: Colors.black),
                        ),
                        title: Text(
                          articlesList[index],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black, size: 30.0)),
                  ),
                );
              })
        ]));
  }
}
