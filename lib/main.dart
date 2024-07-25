import 'package:flutter/cupertino.dart';

class Fraction {
  int numerator;
  int denominator;

  Fraction(this.numerator, this.denominator);

  // Override toán tử cộng
  Fraction operator +(Fraction other) {
    int newNumerator = this.numerator * other.denominator + other.numerator * this.denominator;
    int newDenominator = this.denominator * other.denominator;
    return Fraction(newNumerator, newDenominator);
  }

  // Override toán tử trừ
  Fraction operator -(Fraction other) {
    int newNumerator = this.numerator * other.denominator - other.numerator * this.denominator;
    int newDenominator = this.denominator * other.denominator;
    return Fraction(newNumerator, newDenominator);
  }

  // Override toán tử nhân
  Fraction operator *(Fraction other) {
    int newNumerator = this.numerator * other.numerator;
    int newDenominator = this.denominator * other.denominator;
    return Fraction(newNumerator, newDenominator);
  }

  // Override toán tử chia
  Fraction operator /(Fraction other) {
    int newNumerator = this.numerator * other.denominator;
    int newDenominator = this.denominator * other.numerator;
    return Fraction(newNumerator, newDenominator);
  }


  bool operator >=(Fraction other){
    return (this.numerator/ this.denominator) >= (other.numerator/ other.denominator);
  }
  bool operator <=(Fraction other){
    return (this.numerator/ this.denominator) <= (other.numerator/ other.denominator);
  }
  bool operator >(Fraction other){
    return (this.numerator/ this.denominator) > (other.numerator/ other.denominator);
  }
  bool operator <(Fraction other){
    return (this.numerator/ this.denominator) < (other.numerator/ other.denominator);
  }
  @override
  bool operator ==(Object other){
    if(other is Fraction){
    return (this.numerator/ other.denominator) == (other.numerator/ this.denominator);
  }
    return false;
  }
  @override
  int get hashCode => numerator.hashCode ^ denominator.hashCode;
  @override
  String toString() {
    return '$numerator/$denominator';
  }
}

//Kiểm tra chuỗi

bool isValid(String s) {
  List<String> stack = [];
  Map<String, String> matchingBrackets = {
    ')': '(',
    '}': '{',
    ']': '[',
  };

  for (int i = 0; i < s.length; i++) {
    String char = s[i];
    if (matchingBrackets.containsValue(char)) {
      stack.add(char);
    } else if (matchingBrackets.containsKey(char)) {
      if (stack.isEmpty || stack.removeLast() != matchingBrackets[char]) {
        return false;
      }
    }
  }

  return stack.isEmpty;
}



void main() {
  Fraction f1 = Fraction(1, 2);
  Fraction f2 = Fraction(3, 4);

  print('f1 + f2 = ${f1 + f2}');
  print('f1 - f2 = ${f1 - f2}');
  print('f1 * f2 = ${f1 * f2}');
  print('f1 / f2 = ${f1 / f2}');
  print('f1 >= f2 = ${f1 >= f2}');
  print('f1 <= f2 = ${f1 <= f2}');
  print('f1 > f2 = ${f1 > f2}');
  print('f1 < f2 = ${f1 < f2}');
  print('f1 == f2 = ${f1 == f2}');

  print('"{}()" ${isValid("{}()")}'); // True
  print('"{(})" ${isValid("{(})")}'); // False
  print('"{()})" ${isValid("{()})")}'); // False
}
