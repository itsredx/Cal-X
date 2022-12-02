import 'package:cal_x/constants.dart';
import 'package:math_expressions/math_expressions.dart';

void calculate() {
  String finalQuestion = kUserQuestion;
  finalQuestion = finalQuestion.replaceAll('X', '*');

  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  kUserAnswer = eval.toString();
}