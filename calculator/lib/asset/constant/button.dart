class Number {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Number._();

  static const String zero = "0";
  static const String one = "1";
  static const String two = "2";
  static const String three = "3";
  static const String four = "4";
  static const String five = "5";
  static const String six = "6";
  static const String seven = "7";
  static const String eight = "8";
  static const String nine = "9";

  static const List<String> list = [
    zero,
    one,
    two,
    three,
    four,
    five,
    six,
    seven,
    eight,
    nine
  ];
}

class Sign {
  Sign._();

  static const String clear = "AC";
  static const String plus = "+";
  static const String minus = "-";
  static const String multiplication = "*";
  static const String division = "/";
  static const String dot = ".";
  static const String posNeg = "+/-";
  static const String percent = "%";
  static const String equals = "=";

  static const List<String> list = [
    clear,
    plus,
    minus,
    multiplication,
    division,
    dot,
    posNeg,
    percent,
    equals
  ];
}
