import 'package:calculator/asset/constant/button.dart';
import 'package:calculator/lib/framework.dart';
import 'package:calculator/model/calculate_state.dart';
import 'package:calculator/utils/ext.dart';

class BaseModeViewModel extends BaseViewModel {
  String _output = "0";
  String _memory = '';
  String _sign = "";
  String _input = "";
  int _state = CalculateState.init;

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
    _state = CalculateState.init;
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
    _output = _input;
    notifyListeners();
  }

  void saveToMemory() {
    _memory = _input;
    _input = '';
    notifyListeners();
  }

  void switchState(int state) {
    _state = state;
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
    print('$_memory $_sign $_input $_output');
    if (input.contains(Sign.dot) && input == Sign.dot) return;
    if (input == Sign.clear) {
      clear();
      return;
    }

    bool isNumber = Number.list.contains(input);
    if (_state == CalculateState.init) {
      if (isNumber) {
        _input = input;
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
        _sign = input;
        saveToMemory();
        notifyListeners();
        switchState(CalculateState.enter);
      }
    } else if (_state == CalculateState.enter) {
      if (isNumber) {
        _input = input;
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
        calculate(_sign);
        saveToMemory();
        notifyListeners();
        switchState(CalculateState.enter);
      }
    } else {
      if (isNumber) {
      } else {}
    }

    notifyListeners();
  }
}
