import 'package:calculator/asset/constant/button.dart';
import 'package:calculator/lib/framework.dart';
import 'package:calculator/utils/ext.dart';

class BaseModeViewModel extends BaseViewModel {
  String _output = "0";
  String _memory = '0';
  String _sign = "";
  String _input = "0";

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
    _memory = '0';
    _output = "0";
    _sign = "";
    notifyListeners();
  }

  void add() {
    _input = (_memory.parseDouble() + _input.parseDouble()).toString();
    updateOutput();
  }

  void subtract() {
    _input = (_memory.parseDouble() - _input.parseDouble()).toString();
    updateOutput();
  }

  void multiply() {
    _input = (_memory.parseDouble() * _input.parseDouble()).toString();
    updateOutput();
  }

  void divide() {
    _input = (_memory.parseDouble() / _input.parseDouble()).toString();
    updateOutput();
  }

  void dot() {
    updateOutput();
  }

  void toPercentage() {
    _input = (_input.parseDouble() / 100).toString();
  }

  void reverse() {
    print(_input != '0');
    if (_input != '0') _input = (1 / _input.parseDouble()).toString();
  }

  void updateOutput() {
    _output = _input;
    notifyListeners();
  }

  void saveToMemory() {
    _memory = _input;
    _input = '0';
  }

  void onClick(String input) {
    print('$_memory $_sign $_input $_output');
    if (input.contains(Sign.dot) && input == Sign.dot) return;
    if (input == Sign.clear) clear();
    if (input == Sign.dot && _input.endsWith(Sign.dot)) {
      _input = _input + "0";
      toPercentage();
    }
    if (input == Sign.posNeg) {
      reverse();
    }
    if (Number.list.contains(input)) {
      _input = _input + input;
    }
    if (Sign.actionSignList.contains(input)) {
      saveToMemory();
      if (input != Sign.equals) {
        _sign = input;
      }
      if (_sign.isNotEmpty) {
        if (input == Sign.plus) {
          add();
        } else if (input == Sign.minus) {
          subtract();
        } else if (input == Sign.multiplication) {
          multiply();
        } else if (input == Sign.division) {
          divide();
        } else {
          // do calculation
        }
      }
    }
    notifyListeners();
  }

  void manageState() {}
}
