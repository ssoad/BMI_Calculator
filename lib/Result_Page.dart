import 'package:bmicalculator/Card_Content.dart';
import 'package:bmicalculator/ReUseableCard.dart';
import 'package:flutter/material.dart';

import 'Input_page.dart';

class Result_Page extends StatelessWidget {
  Result_Page({this.BMI, this.Msg, this.Result, this.ResColor});
  final String BMI;
  final String Result;
  final String Msg;
  final Color ResColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('Your Result',
                  style: result_style, textAlign: TextAlign.end),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReUseableCard(
              colour: ActiveCard_color,
              card_child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    Result.toUpperCase(),
                    style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: ResColor),
                  ),
                  Text(
                    BMI,
                    style: BMIText_style,
                  ),
                  Text(
                    Msg,
                    textAlign: TextAlign.center,
                    style: body_style,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Bottom_Button(
              text: 'RECALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
