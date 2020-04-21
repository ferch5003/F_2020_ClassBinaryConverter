import 'package:flutter/material.dart';
import 'package:demo_app/widgets/button.dart';

class DecimalWidget extends StatelessWidget {
  final Function(int) numberChange;

  DecimalWidget({key, this.numberChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton(
                  number: 7,
                  numberChange: numberChange,
                ),
                CustomButton(
                  number: 8,
                  numberChange: numberChange,
                ),
                CustomButton(
                  number: 9,
                  numberChange: numberChange,
                ),
              ]),
        ),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton(
                  number: 4,
                  numberChange: numberChange,
                ),
                CustomButton(
                  number: 5,
                  numberChange: numberChange,
                ),
                CustomButton(
                  number: 6,
                  numberChange: numberChange,
                ),
              ]),
        ),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton(
                  number: 1,
                  numberChange: numberChange,
                ),
                CustomButton(
                  number: 2,
                  numberChange: numberChange,
                ),
                CustomButton(
                  number: 3,
                  numberChange: numberChange,
                ),
              ]),
        ),
        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomButton(
                  number: 0,
                  numberChange: numberChange,
                ),
              ]),
        ),
      ],
    );
  }
}
