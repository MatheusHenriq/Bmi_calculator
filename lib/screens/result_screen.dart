import 'package:bml_calculator/constants.dart';
import 'package:bml_calculator/screens/main_screen.dart';
import 'package:bml_calculator/widget/bottombutton_widget.dart';
import 'package:bml_calculator/widget/gender_widget.dart';
import 'package:flutter/material.dart';




class ResultScreen extends StatelessWidget {
  final double imc_result;
  final String imc_description;
  final String imc_bottomtext;

  const ResultScreen({@required this.imc_result,this.imc_description,this.imc_bottomtext});

  @override
  
    

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
      ),    
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top:25, 
                bottom: 15             
              ),
              child: Text(
                'Seus Resultados',
                style: klabelTextStyle
              ),
            ),          
            Expanded(
              child: MainCard(
                child: Column(
                  
                  children: [
                    SizedBox(height: 60,),
                    Text(
                      imc_description,
                      style: kImcDescriptionTextStyle
                    ),
                    SizedBox(height: 60,),
                    Text(
                      imc_result.toStringAsFixed(1),
                      style : kImcNumberDescriptionWidgetTextStyle
                    ),
                    SizedBox(height: 80,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        imc_bottomtext,
                        style : kBottomButtonWithoutBoldTextStyle
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ContainerButton(
              child: FlatButton(
                onPressed: (){                 
                  Navigator.pop(context);          
                },
                child: Center(
                  child: Text(
                    'RECALCULAR',
                    style: kBottomButtonTextStyle,
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}