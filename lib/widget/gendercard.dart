import 'package:flutter/material.dart';
import 'package:bml_calculator/constants.dart';
import 'package:bml_calculator/widget/gender_widget.dart';



class GenderCard extends StatelessWidget {
  final IconData  icon;
  final String label;
  final Color color;

  const GenderCard({@required this.icon,this.label,this.color});

  @override
  Widget build(BuildContext context) {
    return MainCard(
      color : color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,size:kMainIconSize),
          SizedBox(height: 15,),
          
          Text(label,style: kMainCardTextStyle) 
        ]
      ),
    );
  }
}