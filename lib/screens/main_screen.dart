import 'package:bml_calculator/constants.dart';
import 'package:bml_calculator/widget/buttoscard_widget.dart';
import 'package:bml_calculator/widget/gender_widget.dart';
import 'package:bml_calculator/widget/gendercard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

enum Gender{
  male,
  female
}

class _MainScreenState extends State<MainScreen> {

  Gender gender = Gender.female;
  double _slidervalue = 175;
  int _weightvalue = 50;
  int _agevalue = 28;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Calculadora de IMC')
      ),
      body: Container(
        child : Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        if(gender == Gender.male){
                          setState(() {
                            gender = Gender.female;                    
                          });
                          
                        }
                      },
                      child: GenderCard(
                        icon: FontAwesomeIcons.mars,
                        label: 'HOMEM',
                        color: gender == Gender.male ? kActiveCardColor : kAInactiveCardColor
                      ),
                    ),
                  ),  
                   Expanded(
                    child: GestureDetector(
                      onTap:(){
                        if(gender == Gender.female){
                          setState(() {
                            gender = Gender.male;                    
                          });
                          
                        }

                      },
                      child: GenderCard(
                        icon: FontAwesomeIcons.venus,
                        label: 'MULHER',
                        color: gender == Gender.female ? kActiveCardColor : kAInactiveCardColor
                      ),
                    ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: MainCard(
                child: Column(
                  children: [
                      SizedBox(height:20),
                      Text(
                        'ALTURA',
                        style: kMainCardTextStyle
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${_slidervalue}',
                            style: kCountWidgetTextStyle
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:25),
                            child: Text(
                              'CM', 
                              style : kMainCardTextStyle
                            ),
                          )                             
                        ],
                      ), 
                      Slider(
                        value : _slidervalue,
                        activeColor: kBottomButtonColor,
                        inactiveColor: Colors.white,
                        min : 0,
                        max : 250.0,
                        divisions: 250,
                        onChanged: (double value){
                          setState(() {
                            _slidervalue = value;                          
                          });
                        },
                      ), 
                  ],
                ),
              ),
            ),
            Expanded( 
              child: Row(
                children: [
                  Expanded(
                    child:ButtonsCard(
                      buttonvalue: _weightvalue,
                      label : 'PESO'
                    )
                  ),  
                   Expanded(
                    child:ButtonsCard(
                      buttonvalue: _agevalue,
                      label : 'IDADE'
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child:FlatButton(
                onPressed: (){},
                child: Center(
                  child: Text(
                    'TEXT',
                    style: kBottomButtonTextStyle,
                  )
                ),
              ),
              height: kBottomButtonHeight,
              width:double.infinity,
              color : kBottomButtonColor,   
            ),
          ],
        ),
      ),
    );
  }
}

