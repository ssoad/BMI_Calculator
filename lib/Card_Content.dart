import 'package:flutter/material.dart';

const Color pass = Color(0xFF24d876);
const Color fail = Colors.red;

const lable_style = TextStyle(color: Color(0xFF8d8e98), fontSize: 20.0);
const head_style = TextStyle(
    color: Color(0xFFFFFFFF), fontSize: 50.0, fontWeight: FontWeight.bold);

const result_style = TextStyle(
    color: Color(0xFFFFFFFF), fontSize: 40.0, fontWeight: FontWeight.w700);

const BMIText_style = TextStyle(
    color: Color(0xFFFFFFFF), fontSize: 60.0, fontWeight: FontWeight.bold);

const body_style = TextStyle(
    color: Color(0xFFFFFFFF), fontSize: 22.0, fontWeight: FontWeight.w200);
const bottom_card = TextStyle(
    color: Color(0xFFFFFFFF), fontSize: 25.0, fontWeight: FontWeight.w400);

class Card_Content extends StatelessWidget {
  final IconData icon;
  final String label;
  Card_Content({this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Color(0xFFFFFFFF),
          size: 80.0,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          label,
          style: lable_style,
        )
      ],
    );
  }
}
