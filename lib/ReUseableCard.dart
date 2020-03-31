import 'package:flutter/material.dart';

class ReUseableCard extends StatelessWidget {
  ReUseableCard({@required this.colour, this.card_child, this.Onpress});
  final Color colour;
  final Widget card_child;
  final Function Onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Onpress,
      child: Container(
        child: card_child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
