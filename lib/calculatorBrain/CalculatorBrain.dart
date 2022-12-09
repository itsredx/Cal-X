import 'package:calx/constants.dart';
import 'package:math_expressions/math_expressions.dart';

void calculate() {

  String finalQuestion = kUserQuestion;

  Parser p = Parser();
  Expression exp = p.parse(finalQuestion);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);

  if(kIsRound == true){
    kUserAnswer = eval.toStringAsFixed(0);
  }else if(kIsRound == false){
    kUserAnswer = eval.toStringAsFixed(kRootDecimalPlace);
  }
}

