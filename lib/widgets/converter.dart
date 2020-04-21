import 'package:flutter/material.dart';
import 'package:demo_app/widgets/binary_layout.dart';
import 'package:demo_app/widgets/decimal_layout.dart';

enum WidgetMarker { binary, decimal }

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _binary = "";
  String _decimal = "";
  String text = "Binary -> Decimal";
  WidgetMarker selectedWidgetMarker = WidgetMarker.binary;

  void _binToDec(int k) {
    setState(() {
      _binary = _binary + k.toString();
      _decimal = int.parse(_binary, radix: 2).toRadixString(10);
    });
  }

  void _decToBin(int k) {
    setState(() {
      _decimal = _decimal + k.toString();
      _binary = int.parse(_decimal, radix: 10).toRadixString(2);
    });
  }

  void _clear() {
    setState(() {
      _binary = "";
      _decimal = "";
    });
  }

  Widget getCustomContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.binary:
        return BinaryWidget(
          context: context,
          numberChange: (int number) {
            _binToDec(number);
          },
        );
      case WidgetMarker.decimal:
        return DecimalWidget(
            context: context,
            numberChange: (int number) {
              _decToBin(number);
            });
      default:
        return BinaryWidget(
          context: context,
          numberChange: (int number) {
            _binToDec(number);
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  child: Text("$text",
                      style: TextStyle(color: Theme.of(context).accentColor)),
                  onPressed: () {
                    setState(() {
                      switch (selectedWidgetMarker) {
                        case WidgetMarker.binary:
                          text = "Decimal -> Binary";
                          selectedWidgetMarker = WidgetMarker.decimal;
                          break;
                        case WidgetMarker.decimal:
                          text = "Binary -> Decimal";
                          selectedWidgetMarker = WidgetMarker.binary;
                          break;
                      }
                    });
                  },
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '$_binary',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                      fontSize: 35),
                )),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(8.0),
                child: Text('$_decimal',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).accentColor,
                        fontSize: 35))),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: double.infinity,
                child: getCustomContainer(),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      _clear();
                    },
                    child: Text("Reset",
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ))),
              ),
            ),
          ]),
    );
  }
}
