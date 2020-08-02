import 'package:flutter/material.dart';

import '../constants.dart';

class MeasuringUnitWidget extends StatelessWidget {
  const MeasuringUnitWidget({
    Key key,
    this.label,
    this.color,
    this.onPress,
  }) : super(key: key);

  final String label;
  final Color color;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: MediaQuery.of(context).size.height / 20,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(
          child: Text(label, style: kBodyTextStyle),
        ),
      ),
    );
  }
}
