import 'package:flutter/material.dart';
import 'package:demo_app/widgets/binary_layout.dart';
import 'package:demo_app/widgets/decimal_layout.dart';

enum WidgetMarker { Binary, Decimal }

class LayoutModel extends ChangeNotifier {
  WidgetMarker _state = WidgetMarker.Binary;
  String _binary = "";
  String _decimal = "";
  String _text = "Binary -> Decimal";

  WidgetMarker get state => _state;

  String get binary => _binary;
  String get decimal => _decimal;
  String get text => _text;

  void convertion(int action, int k) {
    switch (action) {
      case 1:
        _binary = _binary + k.toString();
        _decimal = int.parse(_binary, radix: 2).toRadixString(10);
        break;
      case 2:
        _decimal = _decimal + k.toString();
        _binary = int.parse(_decimal, radix: 10).toRadixString(2);
        break;
      case 3:
        _binary = "";
        _decimal = "";
        break;
    }
    notifyListeners();
  }

  void changeView() {
    switch (_state) {
      case WidgetMarker.Binary:
        _text = "Decimal -> Binary";
        changeValue(WidgetMarker.Decimal);
        break;
      case WidgetMarker.Decimal:
        _text = "Binary -> Decimal";
        changeValue(WidgetMarker.Binary);
        break;
    }
  }

  Widget getCustomContainer() {
    switch (_state) {
      case WidgetMarker.Binary:
        return BinaryWidget(
          numberChange: (int number) {
            convertion(1, number);
          },
        );
      case WidgetMarker.Decimal:
        return DecimalWidget(numberChange: (int number) {
          convertion(2, number);
        });
      default:
        return BinaryWidget(
          numberChange: (int number) {
            convertion(1, number);
          },
        );
    }
  }

  void changeValue(WidgetMarker value) {
    _state = value;
    notifyListeners();
  }
}
