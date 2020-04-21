import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final int number;
  final Function(int) numberChange;

  CustomButton({key, this.number, this.numberChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: RaisedButton(
            color: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            elevation: 4,
            onPressed: () => numberChange(number),
            child: Text(number.toString(),
                style: new TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                ))),
      ),
    );
  }
}
