import 'package:flutter/material.dart';
import 'package:demo_app/widgets/button.dart';

class BinaryWidget extends StatelessWidget {
  final BuildContext context;
  final Function(int) numberChange;

  BinaryWidget({key, this.context, this.numberChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CustomButton(
            number: 1,
            numberChange: numberChange,
          ),
          CustomButton(
            number: 0,
            numberChange: numberChange,
          ),
        ]);
  }
}