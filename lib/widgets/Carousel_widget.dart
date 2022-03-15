import 'dart:math';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CarouselWidget extends StatefulWidget {

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {

  int currentPos = 0;
  var pageName = [
    'Login',
    'Movie List',
    'Alert Dialog',
    'Bottom Navigation',
    'Bottom Sheet',
    'Table',
    'Tab Bar',
  ];
  final random = Random();

  var colorList = [];

  void colorG(){
    for(var i in pageName){
      colorList.add(Colors.primaries[random.nextInt(Colors.primaries.length)][random.nextInt(6) * 100]);
    }
  }

  @override
  Widget build(BuildContext context) {

    colorG();

    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: pageName.length,
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                      // height: MediaQuery.of(context).size.height,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPos = index;
                        });
                      }
                  ),
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                        color: colorList[index],
                        alignment: Alignment.center,
                        child: Text(pageName[index]),
                      );
                    },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pageName.map((url) {
                    int index = pageName.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPos == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ]
          )
      ),
    );
  }
}
