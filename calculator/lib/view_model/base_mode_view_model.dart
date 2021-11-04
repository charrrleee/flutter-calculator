import 'package:calculator/asset/constant/button.dart';
import 'package:calculator/lib/framework.dart';
import 'package:calculator/utils/ext.dart';

class BaseModeViewModel extends BaseViewModel {
  String _output = "0";
  String _memory = '';
  String _sign = "";
  String _input = "";

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
    _memory = '';
    _output = "0";
    _sign = "";
    _input = "";
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
    updateOutput();
    notifyListeners();
  }

  void reverse() {
    if (_input.isNotEmpty) {
      _input = _input.contains("-") ? _input.substring(1) : "-${_input}";
    }
    updateOutput();
    notifyListeners();
  }

  void updateOutput() {
    _output = _input.parseDouble().toStringAsFixed(2);
    notifyListeners();
  }

  void saveToMemory() {
    _memory = _input;
    _input = "";
    notifyListeners();
  }

  void calculate(String sign) {
    switch (sign) {
      case Sign.plus:
        add();
        break;
      case Sign.minus:
        subtract();
        break;
      case Sign.multiplication:
        multiply();
        break;
      case Sign.division:
        divide();
        break;
    }
  }

  void onClick(String input) {
    if (_input.contains(Sign.dot) && input == Sign.dot) return;
    if (input == Sign.clear) {
      clear();
      return;
    }
    bool isNumber = Number.list.contains(input);

    if (isNumber && _input == "0") {
      _input = input;
      updateOutput();
      notifyListeners();
    } else if (isNumber) {
      _input += input;
      updateOutput();
      notifyListeners();
    } else {
      if (input == Sign.percent && (_input.isEmpty || _input == '0')) return;
      if (input == Sign.percent) {
        toPercentage();
        return;
      }
      if (input == Sign.posNeg) {
        reverse();
        return;
      }
      if (input == Sign.dot) {
        _input += Sign.dot;
        updateOutput();
        notifyListeners();
        return;
      }
      if (input == Sign.equals) {
        calculate(_sign);
        saveToMemory();
      } else {
        saveToMemory();
      }
      _sign = input;
      notifyListeners();

    }
    print('memory $_memory sign $_sign input $_input output $_output');

  }
}
