import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/myContainer.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator Neumorphism',
      home: MyCalculatorApp(),
    );
  }
}


class MyCalculatorApp extends StatefulWidget {
  const MyCalculatorApp({super.key});

  @override
  MyCalculatorAppState createState() => MyCalculatorAppState();
}

class MyCalculatorAppState extends State<MyCalculatorApp> {
  bool darkMode = false;

  var userQuestion = '';
  var userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          darkMode ? darkMode = false : darkMode = true;
                        });
                      },
                      child: _switchMode()),
                  const SizedBox(height: 80),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: darkMode ? Colors.white : Colors.red),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '=',
                        style: TextStyle(
                            fontSize: 35,
                            color: darkMode ? Colors.green : Colors.grey),
                      ),
                      Text(
                        userQuestion,
                        style: TextStyle(
                            fontSize: 20,
                            color: darkMode ? Colors.green : Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
              Expanded(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(
                          title: 'C',
                          textColor:
                          darkMode ? Colors.green : Colors.redAccent),
                      _buttonRounded(title: '('),
                      _buttonRounded(title: ')'),
                      _buttonRounded(
                          title: '/',
                          textColor: darkMode ? Colors.green : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '7'),
                      _buttonRounded(title: '8'),
                      _buttonRounded(title: '9'),
                      _buttonRounded(
                          title: '*',
                          textColor: darkMode ? Colors.green : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '4'),
                      _buttonRounded(title: '5'),
                      _buttonRounded(title: '6'),
                      _buttonRounded(
                          title: '-',
                          textColor: darkMode ? Colors.green : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '1'),
                      _buttonRounded(title: '2'),
                      _buttonRounded(title: '3'),
                      _buttonRounded(
                          title: '+',
                          textColor: darkMode ? Colors.green : Colors.redAccent)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '0'),
                      _buttonRounded(title: '.'),
                      _buttonRounded(
                          icon: Icons.backspace_outlined,
                          iconColor:
                          darkMode ? Colors.green : Colors.redAccent),
                      GestureDetector(
                        onTap: (){
                          calculate();
                        },
                        child: _buttonRounded(
                            title: '=',
                            textColor: darkMode ? Colors.green : Colors.redAccent),
                      )
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRounded(
      {String? title,
        double padding = 17,
        IconData? icon,
        Color? iconColor,
        Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: (){
          if(title == 'C'){
            setState(() {
              userQuestion = '';
              userAnswer = '';
            });
          }else if(icon == Icons.backspace_outlined) {
            setState(() {
              userQuestion = userQuestion.substring(0, userQuestion.length - 1);
            });
          }else if(title == '='){
            setState(() {
              calculate();
            });
          }else{
          setState(() {
            userQuestion += title!;
          });
          }
        },
        child: MyContainer(
          darkMode: darkMode,
          borderRadius: BorderRadius.circular(25),
          padding: EdgeInsets.all(padding),
          child: SizedBox(
            width: padding * 2,
            height: padding * 2,
            child: Center(
                child: title != null
                    ? Text(
                  title,
                  style: TextStyle(
                      color: textColor != null
                          ? textColor
                          : darkMode
                          ? Colors.white
                          : Colors.black,
                      fontSize: 30),
                )
                    : Icon(
                  icon,
                  color: iconColor,
                  size: 30,
                )),
          ),
        ),
      ),
    );
  }

  Widget _buttonOval({required String title, double padding = 17}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MyContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(50),
        padding:
        EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        child: SizedBox(
          width: padding * 2,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: darkMode ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return MyContainer(
      darkMode: darkMode,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 70,
        child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            Icons.wb_sunny,
            color: darkMode ? Colors.grey : Colors.redAccent,
          ),
          Icon(
            Icons.nightlight_round,
            color: darkMode ? Colors.green : Colors.grey,
          ),
        ]),
      ),
    );
  }

  void calculate() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('X', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}

