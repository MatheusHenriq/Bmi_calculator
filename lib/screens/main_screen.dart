import 'package:bml_calculator/constants.dart';
import 'package:bml_calculator/screens/result_screen.dart';
import 'package:bml_calculator/widget/bottombutton_widget.dart';
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
  int _weightvalue = 50 ;
  int _agevalue = 28;
  String _label = '';
  double _imc_result= 0.0;
  String _imc_bottomtext = '';
  void setImc(){
    setState(() {
         _imc_result =  (_weightvalue/((_slidervalue*_slidervalue)/10000));
        });
  }
  String setLabel(){
    setState(() {
      if (_imc_result < 18.5){
        _imc_bottomtext = 'Seu peso está abaixo do normal. Tente comer mais!';
        return _label = 'Abaixo do Peso';
      }
      if (_imc_result < 24.9){
        _imc_bottomtext = 'Seu peso normal. Não mude sua alimentação!';
        return _label = 'Peso Normal';
      }
      if (_imc_result < 29.9){
        _imc_bottomtext = 'Seu peso está um pouco acima do normal. Tente comer menos!';
        return _label = 'Pré-Obesidade';
      }
      if (_imc_result < 34.9){
        _imc_bottomtext = 'Seu peso está acima do normal. Tente comer menos!';
        return _label = 'Obesidade Grau 1';
      }
      if (_imc_result < 39.9){
        _imc_bottomtext = 'Seu peso está bem acima do normal. Tente comer menos!';
        return _label = 'Obesidade Grau 2';
      }
      else {
        _imc_bottomtext = 'Seu peso está muito acima do normal. Tente comer menos!';
        return _label = 'Obesidade Grau 3';
      } 
    });   
  }

  void increment_weightvalue(){
    
        _weightvalue++;
        
  }
  void decrement_weightvalue(){
    
        _weightvalue--;
        
  }
  void increment_agevalue(){
   
        _agevalue++;
  }
  void decrement_agevalue(){ 
        
        _agevalue--;
  }

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
                        min : 120,
                        max : 250.0,
                        divisions: 130,
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
                      onpressedplus: increment_weightvalue,
                      onpressedminus: decrement_weightvalue,
                      buttonvalue: _weightvalue,
                      label : 'PESO'
                    )
                  ),  
                   Expanded(
                    child:ButtonsCard(
                      buttonvalue: _agevalue,
                      onpressedplus: increment_agevalue,
                      onpressedminus: decrement_agevalue,
                      label : 'IDADE'
                    ),
                  ),
                ],
              ),
            ),

            ContainerButton(
              child: FlatButton(
                  onPressed: (){ 
                    print('${_weightvalue}');
                    setImc();
                    setLabel();
                    Navigator.push(context,MaterialPageRoute(builder: (context)=> ResultScreen(
                        imc_result:  _imc_result, 
                        imc_description: _label,
                        imc_bottomtext: _imc_bottomtext,
                      )
                      ));
                  },
                  child: Center(
                    child: Text(
                      'CALCULAR',
                      style: kBottomButtonTextStyle,
                    )
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
