import 'package:bmicalculator/Calculator_Brain.dart';
import 'package:bmicalculator/Result_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Card_Content.dart';
import 'ReUseableCard.dart';
import 'RoundIconButton.dart';

enum Gender { male, female }
const ActiveCard_color = Color(0xFF1d1e33);
const InactiveCard_color = Color(0xFF111328);
const Button_color = Color(0xFFEB1555);

class Input_page extends StatefulWidget {
  @override
  _Input_pageState createState() => _Input_pageState();
}

class _Input_pageState extends State<Input_page> {
  Color maleCard = InactiveCard_color;
  Color femalecard = InactiveCard_color;
  Gender SelectGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  //1=male, 2=female//
//  void update_color(Gender genderSelected) {
//    if (genderSelected == Gender.male) {
//      if (maleCard == InactiveCard_color) {
//        maleCard = ActiveCard_color;
//        femalecard = InactiveCard_color;
//      } else {
//        maleCard = InactiveCard_color;
//      }
//    }
//    if (genderSelected == Gender.female) {
//      if (femalecard == InactiveCard_color) {
//        femalecard = ActiveCard_color;
//        maleCard = InactiveCard_color;
//      } else {
//        femalecard = InactiveCard_color;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUseableCard(
                    Onpress: () {
                      setState(() {
                        SelectGender = Gender.male;
                      });
                    },
                    card_child: Card_Content(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: SelectGender == Gender.male
                        ? ActiveCard_color
                        : InactiveCard_color,
                  ),
                ),
                Expanded(
                  child: ReUseableCard(
                    Onpress: () {
                      setState(() {
                        SelectGender = Gender.female;
                      });
                    },
                    colour: SelectGender == Gender.female
                        ? ActiveCard_color
                        : InactiveCard_color,
                    card_child: Card_Content(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReUseableCard(
              colour: ActiveCard_color,
              card_child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: lable_style,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: head_style,
                      ),
                      Text(
                        'cm',
                        style: lable_style,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8d8e98),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Color(0xFFFFFFFF),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 25.0,
                      ),
                      overlayColor: Color(0x15EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double NewVal) {
                        setState(() {
                          height = NewVal.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReUseableCard(
                    colour: ActiveCard_color,
                    card_child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: lable_style,
                        ),
                        Text(
                          weight.toString(),
                          style: head_style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseableCard(
                    colour: ActiveCard_color,
                    card_child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: lable_style,
                        ),
                        Text(
                          age.toString(),
                          style: head_style,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Bottom_Button(
            text: 'CALCULATE',
            onTap: () {
              Calculator_Brain calc = Calculator_Brain(
                height: height,
                weight: weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result_Page(
                    BMI: calc.Cal_BMI().toStringAsFixed(1),
                    Result: calc.Get_Result(),
                    Msg: calc.Get_Messege(),
                    ResColor: calc.Cal_BMI() > 18.5 && calc.Cal_BMI() < 25
                        ? pass
                        : fail,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class Bottom_Button extends StatelessWidget {
  final String text;
  final Function onTap;
  Bottom_Button({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: bottom_card,
          ),
        ),
        color: Button_color,
        margin: EdgeInsets.only(top: 20.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}
