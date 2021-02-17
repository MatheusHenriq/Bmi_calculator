import 'package:bml_calculator/constants.dart';
import 'package:flutter/material.dart';


class MainCard extends StatelessWidget {
  
  final Widget child;
  final Color color;
  
  const MainCard({@required  this.child, this.color=kActiveCardColor});
    

  @override
  Widget build(BuildContext context) {
    return Container(
      child : child,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),       
    ),         
    );
  }
}