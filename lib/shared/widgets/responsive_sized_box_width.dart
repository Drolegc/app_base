import 'package:flutter/material.dart';

class ResponsiveSizedBoxWidth extends StatelessWidget {

  Widget child;

  ResponsiveSizedBoxWidth({required this.child});

  @override
  Widget build(BuildContext context) {

    var padding = 0;

    if(MediaQuery.of(context).size.width > 481)
      padding = 2;
    if(MediaQuery.of(context).size.width > 769)
      padding = 6;
    if(MediaQuery.of(context).size.width > 1025)
      padding = 8;

    padding = padding * 10;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.toDouble()),
      child: child,
    );
  }
}
