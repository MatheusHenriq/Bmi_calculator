import 'package:bml_calculator/constants.dart';
import 'package:bml_calculator/widget/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonsCard extends StatefulWidget {
  const ButtonsCard({
    Key key,
    @required int buttonvalue,
    @required String label,
  }) : buttonvalue = buttonvalue, label = label, super(key: key);
  
  final int buttonvalue;
  final String label;

  @override
  _ButtonsCardState createState() => _ButtonsCardState(buttonvalue,label);
}

class _ButtonsCardState extends State<ButtonsCard> {
  
  int buttonvalue;
  String label;
  _ButtonsCardState(this.buttonvalue,this.label);
  

  @override
  Widget build(BuildContext context) {
    return MainCard(
      child: Column(
          children: [
            SizedBox(height:20),

            Text(
              label,
              style: kMainCardTextStyle 
            ),

            Text(
              '${buttonvalue}',
              style: kCountWidgetTextStyle
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      buttonvalue--;                                
                    });
                  },
                  child: Icon(FontAwesomeIcons.minus),
                  color : kFloatingButtonColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15)
                ),
                MaterialButton(
                  onPressed: (){
                    setState(() {
                      buttonvalue++;                                
                    });
                  },
                  child: Icon(FontAwesomeIcons.plus),
                  color : kFloatingButtonColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15)
                ),
              ],
            ),
          ],
        ),
    );
  }
}



