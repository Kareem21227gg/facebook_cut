import 'package:flutter/material.dart';
import 'dart:math';

class Stop extends StatelessWidget {
  final Random random = Random();
  @override
  Widget build(BuildContext context) {
    int x =random.nextInt(24);
    if(x==0)x++;
    return Container(
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(
            "lib/images/Wasting-Time-Quotes-Wallpaper-$x.png"),
      ),
    );
  }
}
