import 'package:calculator/asset/constant/button.dart';
import 'package:calculator/lib/framework.dart';
import 'package:calculator/model/calculation_state.dart';
import 'package:calculator/utils/ext.dart';

class BaseModeViewModel extends BaseViewModel {
  String _output = "0";
  List<String> equation = [];

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
    equation = [];
    _output = "0";
    notifyListeners();
  }

  String add() {
    return "";
  }

  String subtract() {
    return "";
  }

  String multiply() {
    return "";
  }

  String divide() {
    return "";
  }

  String dot() {
    return "";
  }

  String setPercentage(String input) {
    return (input.parseDouble() / 100).toString();
  }

  void onClick(String input) {
    if (input == Sign.clear) clear();
    if (input == Sign.dot && equation.isEmpty) {
    }
    notifyListeners();
  }

  void manageState() {

  }
}
