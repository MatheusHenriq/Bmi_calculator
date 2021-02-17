import 'package:bml_calculator/constants.dart';
import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
 
  
  final Widget child;
  const ContainerButton({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child : child,
      margin: EdgeInsets.only(top: 10),
      height: kBottomButtonHeight,
      width:double.infinity,
      color : kBottomButtonColor,   
    );
  }
}



