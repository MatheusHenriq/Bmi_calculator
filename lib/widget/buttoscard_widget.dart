import 'package:bml_calculator/constants.dart';
import 'package:bml_calculator/widget/gender_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonsCard extends StatefulWidget {
  const ButtonsCard({
    Key key,
    @required int buttonvalue,
    @required String label,
    this.onpressedplus,
    this.onpressedminus,
  }) : buttonvalue = buttonvalue, label = label, super(key: key);
  
  final int buttonvalue;
  final String label;
  final Function() onpressedplus;
  final Function() onpressedminus;

  @override
  _ButtonsCardState createState() => _ButtonsCardState(buttonvalue,label);
}

class _ButtonsCardState extends State<ButtonsCard> {
  
  int buttonvalue;
  String label;
  _ButtonsCardState(this.buttonvalue,this.label);
  
  void increment_buttonvalue(){
    setState(() {
          buttonvalue++;
        });
  }

  void decrement_buttonvalue(){
    setState(() {
          buttonvalue--;
        });
  }

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
                    widget.onpressedminus();
                    decrement_buttonvalue();
                  },
                  child: Icon(FontAwesomeIcons.minus),
                  color : kFloatingButtonColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(15)
                ),
                MaterialButton(
                  onPressed: (){
                    widget.onpressedplus();
                    increment_buttonvalue();
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



