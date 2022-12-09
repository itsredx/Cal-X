import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:powers/powers.dart';
import 'package:flutter/material.dart';
import 'calculatorBrain/CalculatorBrain.dart';
import 'components/mycontainer.dart';
import 'constants.dart';
import 'main.dart';

class MyScientificCal extends StatefulWidget {
  const MyScientificCal({super.key});

  @override
  MyScientificCalState createState() => MyScientificCalState();
}

class MyScientificCalState extends State<MyScientificCal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkMode ? kDarkThemeColor : kLightThemeColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(
                              () {
                                kDarkMode
                                    ? kDarkMode = false
                                    : kDarkMode = true;
                              },
                            );
                          },
                          child: _switchThemeMode(padding: MediaQuery.of(context).size.width / 43,)),
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '=',
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width / 8,//20,
                                  color: kDarkMode
                                      ? Colors.white
                                      : Colors.redAccent),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    kUserAnswer,
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width / 7,
                                        fontWeight: FontWeight.bold,
                                        color: kDarkMode
                                            ? Colors.white
                                            : Colors.red),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          roundEdgeButton(
                              borderRadius: 10,
                              padding: MediaQuery.of(context).size.width / 25,
                              icon: Icons.arrow_back_rounded,
                              iconColor:
                                  kDarkMode ? Colors.green : Colors.redAccent),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  kUserQuestion,
                                  style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width / 12,//20,
                                      color: kDarkMode
                                          ? Colors.green
                                          : Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox())
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            roundEdgeButton(
                                padding: MediaQuery.of(context).size.width / 22,
                                fontSize: 18,
                                title: 'C',
                                textColor: kDarkMode
                                    ? Colors.green
                                    : Colors.redAccent),
                            roundEdgeButton(
                              title: '(',
                              fontSize: 18,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                              title: ')',
                              fontSize: 18,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                                padding: MediaQuery.of(context).size.width / 22,
                                title: '%',
                                textColor:
                                    kDarkMode ? Colors.green : Colors.redAccent)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            roundEdgeButton(
                              title: 'e',
                              fontSize: 18,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                              title: '√',
                              fontSize: 18,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                              title: 'log',
                              fontSize: MediaQuery.of(context).size.width / 22,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(fontSize: MediaQuery.of(context).size.width / 20,
                                padding: MediaQuery.of(context).size.width / 22,
                                title: 'sin',
                                textColor:
                                    kDarkMode ? Colors.green : Colors.redAccent)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            roundEdgeButton(
                              title: 'π',
                              fontSize: 18,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                              title: 'a^b',
                              fontSize: MediaQuery.of(context).size.width / 20,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                              title: '3√',
                              fontSize: 17,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(fontSize: MediaQuery.of(context).size.width / 20,
                                padding: MediaQuery.of(context).size.width / 22,
                                title: 'cos',
                                textColor:
                                    kDarkMode ? Colors.green : Colors.redAccent)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            roundEdgeButton(
                              title: '4√',
                              fontSize: 17,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                              title: 'x!',
                              fontSize: 17,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                              title: decimalPlaceButtonText,
                              fontSize: MediaQuery.of(context).size.width / 26,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(fontSize: MediaQuery.of(context).size.width / 20,
                                padding: MediaQuery.of(context).size.width / 22,
                                title: 'tan',
                                textColor:
                                    kDarkMode ? Colors.green : Colors.redAccent)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            roundEdgeButton(
                              title: '10*',
                              fontSize: MediaQuery.of(context).size.width / 20,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                              title: 'ANS',
                              fontSize: MediaQuery.of(context).size.width / 23,
                              padding: MediaQuery.of(context).size.width / 22,
                            ),
                            roundEdgeButton(
                                padding: MediaQuery.of(context).size.width / 22,
                                icon: Icons.backspace_outlined,
                                iconColor: kDarkMode
                                    ? Colors.green
                                    : Colors.redAccent),
                            GestureDetector(
                              onTap: () {
                                calculate();
                              },
                              child: roundEdgeButton(
                                  padding:
                                      MediaQuery.of(context).size.width / 22,
                                  title: '=',
                                  fontSize: 20,
                                  textColor: kDarkMode
                                      ? Colors.green
                                      : Colors.redAccent),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget roundEdgeButton({
    String? title,
    double fontSize = 13,
    double padding = 10,
    IconData? icon,
    Color? iconColor,
    Color? textColor,
    double? borderRadius = 15,
    double edgeInsets = 5,
  }) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: GestureDetector(
        onTap: () {
          if (title == 'C') {
            setState(
              () {
                kUserQuestion = '';
                kUserAnswer = '';
                kUserBackEndQ = '';
                kUserBackEndA = '';
                point = true;
              },
            );
          } else if (title == 'ANS') {
            setState(() {
              if(kUserAnswer.contains('.')){
                setState(() {
                  point = false;
                });
              }else{
                setState(() {
                  point = true;
                });
              }
              kUserQuestion = kUserAnswer;
            });
          } else if (icon == Icons.backspace_outlined) {
            setState(
              () {
                kUserQuestion =
                    kUserQuestion.substring(0, kUserQuestion.length - 1);
              },
            );
          } else if(title == '=' && kCalculate == true ){
            setState(() {
              calculate();
            });
          }else if (title == '=') {
            setState(
              () {
                if (kIsLog == true) {
                  setState(() {
                    var regexp = RegExp(r'(log)(\d+)');
                    var matches = regexp.allMatches(kUserQuestion);
                    var num1list = matches.map((e) => e.group(2)).toList();
                    double num1;
                    var sqstring = num1list[0].toString();
                    num1 = double.parse(sqstring);
                    var myLog = log(num1);
                    if (kIsRound == true) {
                      setState(() {
                        kLogDecimalPlace = 0;
                      });
                    } else if (kIsRound == false) {
                      setState(() {
                        kLogDecimalPlace = 4;
                      });
                    }
                    kUserBackEndA = myLog.toStringAsFixed(kLogDecimalPlace);
                    kUserAnswer = kUserBackEndA;
                  });
                } else if (kIsSquareRoot == true) {
                  setState(() {
                    var regexp = RegExp(r'(√)(\d+)');
                    var matches = regexp.allMatches(kUserQuestion);
                    var squareRoots = matches.map((e) => e.group(2)).toList();
                    var sqstring = squareRoots[0].toString();
                    var num1 = double.parse(sqstring);
                    var mySquareRoots = sqrt(num1);
                    if (kIsRound == true) {
                      setState(() {
                        kRootDecimalPlace = 0;
                      });
                    } else if (kIsRound == false) {
                      setState(() {
                        kRootDecimalPlace = 2;
                      });
                    }
                    kUserBackEndA =
                        mySquareRoots.toStringAsFixed(kRootDecimalPlace);
                    kUserAnswer = kUserBackEndA;
                  });
                } else if (kIsCubeRoot == true) {
                  setState(() {
                    var regexp = RegExp(r'(3√)(\d+)');
                    var matches = regexp.allMatches(kUserQuestion);
                    var cubeRoots = matches.map((e) => e.group(2)).toList();
                    var cubeString = cubeRoots[0].toString();
                    var num1 = double.parse(cubeString);
                    var myCubeRoots = num1.cbrt();
                    kUserBackEndA =
                        myCubeRoots.toStringAsFixed(kLogDecimalPlace);
                    kUserAnswer = kUserBackEndA;
                  });
                } else if (kIsPower == true ||
                    kIsExponent == true ||
                    kIsFactorial == true) {
                  setState(() {
                    calculate();
                  });
                } else if (kIsPercent == true) {
                  setState(() {
                    calculate();

                    // var regexp = RegExp(r'(\d+)(/)(\d+)(%)');
                    // var matches = regexp.allMatches(kUserQuestion);
                    // var num1list = matches.map((e) => e.group(1)).toList();
                    // var num2list = matches.map((e) => e.group(3)).toList();
                    // double num1;
                    // double num2;
                    // var sqstring = num1list[0].toString();
                    // var sq2string = num2list[0].toString();
                    // num1 = double.parse(sqstring);
                    // num2 = double.parse(sq2string);
                    // var percent = (num1 / num2) * 100;
                    //
                    // kUserBackEndA = percent.toStringAsFixed(1);
                    // kUserAnswer = kUserBackEndA;
                  });
                } else if (kIsForthRoot = true) {
                  setState(() {
                    var regexp = RegExp(r'(4√)(\d+)');
                    var matches = regexp.allMatches(kUserQuestion);
                    var forthRoots = matches.map((e) => e.group(2)).toList();
                    var forthString = forthRoots[0].toString();
                    var num1 = double.parse(forthString);
                    var myForthRoots = num1.root(4);
                    if (kDebugMode) {
                      print(myForthRoots);
                    }
                    kUserBackEndA =
                        myForthRoots.toStringAsFixed(kRootDecimalPlace);
                    kUserAnswer = kUserBackEndA;
                    if (kUserBackEndA != '') {
                      kUserAnswer = kUserBackEndA;
                    }
                  });
                }
              },
            );
          } else if (title == 'sin' ||
              title == 'cos' ||
              title == 'tan' ||
              title == '(' ||
              title == ')') {
            setState(() {
              kUserQuestion += title!;
              kCalculate = true;
              kUserBackEndQ = kUserQuestion;
              point = true;
            });
          } else if (title == '.' && point == true) {
            setState(() {
              kUserQuestion += title!;
              point = false;
            });
          } else if (title == 'π') {
            setState(() {
              kUserQuestion += pi.toStringAsFixed(3);
              kUserBackEndQ = kUserQuestion;
            });
          } else if (title == '√') {
            setState(() {
              kIsSquareRoot = true;
              kIsCubeRoot = true;
              kIsForthRoot = true;
              kIsLog = false;
              kCalculate = false;
              kIsPercent = false;
              kIsFactorial = false;
              kIsPower = false;
              kIsExponent = false;
              kUserQuestion += title!;
              // var regexp = RegExp(r'(√[\d]+)[+\-*/]?');
              // var matches = regexp.allMatches(kUserQuestion);
              // var squareRoots = matches.map((e) => e.group(1)).toList();
              // var sqstring = squareRoots[0].toString().replaceAll('√', '');
              // var num1 = double.parse(sqstring);
              // var mySquareRoots = sqrt(num1);
              // kUserBackEndA = mySquareRoots.toStringAsFixed(2);
              /*for (var i in squareRoots) {
                var i2 = i?.replaceFirst('√', '');
                double toSquareRoot = sqrt(double.parse(i2.toString()));
                kUserBackEndA = kUserQuestion.replaceAll(
                    i.toString(), toSquareRoot.toStringAsFixed(4));
              }*/
            });
          } else if (title == '%') {
            setState(() {
              kUserQuestion += '*100';
              kIsPercent = true;
              kIsForthRoot = false;
              kIsCubeRoot = false;
              kCalculate = false;
              kIsSquareRoot = false;
              kIsLog = false;
              kIsFactorial = false;
              kIsPower = false;
              kIsExponent = false;
            });
          } else if (title == '10*') {
            setState(() {
              kUserQuestion += '10^';
              kIsPower = true;
              kIsPercent = true;
              kCalculate = false;
              kIsForthRoot = false;
              kIsCubeRoot = false;
              kIsSquareRoot = false;
              kIsLog = false;
              kIsFactorial = false;
              kIsExponent = false;
              // var regexp = RegExp(r'(\d+)(%)(\d+)');
              // var matches = regexp.allMatches(kUserQuestion);
              // var num1list = matches.map((e) => e.group(1)).toList();
              // var num2list = matches.map((e) => e.group(3)).toList();
              // double num1;
              // double num2;
              // var sqstring = num1list[0].toString();
              // var sq2string = num2list[0].toString();
              // num1 = double.parse(sqstring);
              // num2 = double.parse(sq2string);
              // var power = pow(num1, num2);
              // kUserBackEndQ = kUserQuestion.replaceAll(
              //     '10^$num2', power.toStringAsFixed(2));
            });
          } else if (title == 'x!') {
            setState(() {
              kUserQuestion += '!';
              kUserBackEndQ = kUserQuestion;
              kIsFactorial = true;
              kIsRound = true;
              kCalculate = false;
              kIsForthRoot = true;
              kIsCubeRoot = false;
              kIsSquareRoot = false;
              kIsLog = false;
              kIsPercent = false;
              kIsPower = false;
              kIsExponent = false;
            });
          } else if (title == 'a^b') {
            setState(() {
              kUserQuestion += '^';
              kIsPower = true;
              kIsForthRoot = true;
              kIsCubeRoot = false;
              kIsSquareRoot = false;
              kCalculate = false;
              kIsLog = false;
              kIsPercent = false;
              kIsFactorial = false;
              kIsExponent = false;
            });

            // var regexp = RegExp(r'(\d+)(^)(\d+)');
            // var matches = regexp.allMatches(kUserQuestion);
            // var baseNum = matches.map((e) => e.group(1)).toList();
            // var powerNum = matches.map((e) => e.group(3)).toList();
            // double num1;
            // double num2;
            // var baseString = baseNum[0].toString();
            // var powerString = powerNum[0].toString();
            // num1 = double.parse(baseString);
            // num2 = double.parse(powerString);
            // var power = pow(num1, num2);
            // kUserBackEndQ =
            //     kUserQuestion.replaceAll('10^$num2', power.toStringAsFixed(2));
          } else if (title == 'e') {
            setState(() {
              kUserQuestion += '${title!}^';
              kIsExponent = true;
              kIsForthRoot = true;
              kIsCubeRoot = false;
              kIsSquareRoot = false;
              kCalculate = false;
              kIsLog = false;
              kIsPercent = false;
              kIsFactorial = false;
              kIsPower = false;
              if (kIsRound == true) {
                setState(() {
                  kLogDecimalPlace = 0;
                });
              } else if (kIsRound == false) {
                setState(() {
                  kLogDecimalPlace = 4;
                });
              }
            });
          } else if (title == 'log') {
            setState(() {
              kIsLog = true;
              kIsForthRoot = true;
              kIsCubeRoot = false;
              kIsSquareRoot = false;
              kIsPercent = false;
              kCalculate = false;
              kIsFactorial = false;
              kIsPower = false;
              kIsExponent = false;
              kUserQuestion += title!;
              // var regexp = RegExp(r'(log)(\d+)');
              // var matches = regexp.allMatches(kUserQuestion);
              // var num1list = matches.map((e) => e.group(2)).toList();
              // double num1;
              // var sqstring = num1list[0].toString();
              // num1 = double.parse(sqstring);
              // var Log = log(num1);
              // kUserBackEndA = Log.toStringAsFixed(4);
            });
          } else if (title == '3√') {
            setState(() {
              kUserQuestion += title!;
              kIsForthRoot = false;
              kIsCubeRoot = true;
              kIsSquareRoot = false;
              kIsLog = false;
              kCalculate = false;
              kIsPercent = false;
              kIsFactorial = false;
              kIsPower = false;
              kIsExponent = false;
            });
          } else if (title == '4√') {
            setState(() {
              kUserQuestion += title!;
              kIsForthRoot = true;
              kIsCubeRoot = false;
              kIsSquareRoot = false;
              kIsLog = false;
              kCalculate = false;
              kIsPercent = false;
              kIsFactorial = false;
              kIsPower = false;
              kIsExponent = false;
            });
          } else if (title == 'Nom') {
            setState(() {
              kIsRound = false;
              decimalPlaceButtonText = 'Dec';
            });
          } else if (title == 'Dec') {
            setState(() {
              kIsRound = true;
              decimalPlaceButtonText = 'Nom';
            });
          } else if (icon == Icons.arrow_back_rounded) {
            setState(() {
              if (kUserQuestion.contains('log') ||
                  kUserQuestion.contains('√') ||
                  kUserQuestion.contains('!') ||
                  kUserQuestion.contains('e') ||
                  kUserQuestion.contains('3√') ||
                  kUserQuestion.contains('4√') ||
                  kUserQuestion.contains('^')||
                  kUserQuestion.contains('sin')||
                  kUserQuestion.contains('cos')||
                  kUserQuestion.contains('tan')) {
                setState(() {
                  kCalculate = false;
                });
              } else {
                    () {
                  setState(() {
                    kCalculate = true;
                  });
                };
              }

              kUserAnswer = kUserAnswer;
              kUserQuestion = kUserQuestion;
              //Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyCalculatorApp()));
            });
          }
        },
        child: MyContainer(
          darkMode: kDarkMode,
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width / borderRadius!,
          ),
          padding: EdgeInsets.all(padding),
          child: SizedBox(
            width: padding * 2,
            height: padding * 2,
            child: Center(
              child: title != null
                  ? Text(
                      title,
                      style: TextStyle(
                        color: textColor ??
                            (kDarkMode ? Colors.white : Colors.black),
                        fontSize: fontSize,
                      ),
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                      size: 20,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchThemeMode({required double padding}) {
    return MyContainer(
      darkMode: kDarkMode,
      padding: EdgeInsets.all(padding),
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: kDarkMode ? Colors.grey : Colors.redAccent,
              size: 18,
            ),
            Icon(
              Icons.nightlight_round,
              color: kDarkMode ? Colors.green : Colors.grey,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
