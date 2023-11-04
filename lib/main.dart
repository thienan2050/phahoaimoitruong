import 'package:flutter/material.dart';
import 'dart:math' as math;

var title = ['Áo', 'Quần', '3','Giày','5','6','7','8','9','10'];


main() => runApp(MaterialApp(home: MyHomePage()));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phá hoại môi trường : em bé Be'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        itemBuilder: (BuildContext context, int index) {
          if(index % 3 == 0) {
            print(index);
            return _buildCarousel(context, index ~/ 2);
          }
          else {
            return Divider();
          }
        },
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(title[carouselIndex]),
        SizedBox(
          // you may want to use an aspect ratio here for tablet support
          height: 200.0,
          child: PageView.builder(
            // store this controller in a State to save the carousel scroll position
            controller: PageController(viewportFraction: 0.8),
            itemBuilder: (BuildContext context, int itemIndex) {
              return _buildCarouselItem(context, carouselIndex, itemIndex);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}