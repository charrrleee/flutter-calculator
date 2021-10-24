import 'package:calculator/asset/constant/button.dart';
import 'package:calculator/lib/framework.dart';
import 'package:calculator/utils/annotation.dart';
import 'package:calculator/utils/ext.dart';

class BaseModeViewModel extends BaseViewModel {
  String _output = "0";
  String _firstNumber = "0";
  String _secondNumber = "0";
  String _sign = "";

  String get output => _output;

  List<String> firstRow = [
    Sign.clear,
    Sign.posNeg,
    Sign.percent,
    Sign.division
  ];
  List<String> secondRow = [
    Number.seven,
    Number.eight,
    Number.nine,
    Sign.multiplication
  ];
  List<String> thirdRow = [Number.four, Number.five, Number.six, Sign.minus];
  List<String> fourthRow = [Number.one, Number.two, Number.three, Sign.plus];
  List<String> fifthRow = [
    Number.zero,
    Sign.dot,
    Sign.equals,
  ];

  void clear() {
    _firstNumber = "0";
    _secondNumber = "0";
    _sign = "";
    _output = "0";
  }

  void calculation() {
    switch (_sign) {
      case Sign.plus:
        _output = (_firstNumber.parseDouble() + _secondNumber.parseDouble())
            .toString();
        break;
      case Sign.minus:
        _output = (_firstNumber.parseDouble() - _secondNumber.parseDouble())
            .toString();
        break;
      case Sign.multiplication:
        _output = (_firstNumber.parseDouble() * _secondNumber.parseDouble())
            .toString();
        break;
      case Sign.division:
        _output = (_firstNumber.parseDouble() / _secondNumber.parseDouble())
            .toString();
        break;
    }
  }

  // todo
  // @notify
  void onClick(String input) {
    if (input.endsWith(Sign.dot)) {
      _firstNumber += input;
      _output = _firstNumber;
      return;
    }
    if (Number.list.contains(input)) {
      _output = input;
      if (_firstNumber.isEmpty) {
        _firstNumber = input;
      } else {
        if (_sign.isEmpty) {
          _firstNumber = input;
        } else {
          _secondNumber = input;
        }
      }
    } else if (input == Sign.clear) {
      clear();
    } else if (input == Sign.dot) {
      if (_output.contains(Sign.dot)) return;
      _output += Sign.dot;
    } else if (input == Sign.percent) {
      _output = (double.parse(_output) / 100).toString();
    } else if (input == Sign.posNeg) {
      _output = _output.contains("-") ? _output.substring(1) : "-$output";
      if (_secondNumber.isNotEmpty) {
        _secondNumber = _output;
      } else {
        _firstNumber = _output;
      }
    } else {
      if (_sign.isNotEmpty) {
        if ([Sign.division, Sign.multiplication, Sign.plus, Sign.minus]
            .contains(input)) {
          calculation();
        } else if (Sign.equals == input) {
          if (_sign.isEmpty) return;
          calculation();
        }
        String temp = _output;
        clear();
        _firstNumber = temp;
        _output = temp;
      } else {
        _sign = input;
      }
    }
    notifyListeners();
  }
}
