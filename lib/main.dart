import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/mycontainer.dart';
import 'calculatorBrain/CalculatorBrain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalX',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkMode ? kDarkThemeColor : kLightThemeColor,
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
                        setState(
                          () {
                            kDarkMode ? kDarkMode = false : kDarkMode = true;
                          },
                        );
                      },
                      child: _switchThemeMode()),
                  const SizedBox(height: 70),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      kUserAnswer,
                      style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                          color: kDarkMode ? Colors.white : Colors.red),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '=',
                        style: TextStyle(
                            fontSize: 35,
                            color: kDarkMode ? Colors.green : Colors.grey),
                      ),
                      Text(
                        kUserQuestion,
                        style: TextStyle(
                            fontSize: 20,
                            color: kDarkMode ? Colors.green : Colors.grey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        roundEdgeButton(
                            title: 'C',
                            textColor:
                                kDarkMode ? Colors.green : Colors.redAccent),
                        roundEdgeButton(title: '('),
                        roundEdgeButton(title: ')'),
                        roundEdgeButton(
                            title: '/',
                            textColor:
                                kDarkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        roundEdgeButton(title: '7'),
                        roundEdgeButton(title: '8'),
                        roundEdgeButton(title: '9'),
                        roundEdgeButton(
                            title: '*',
                            textColor:
                                kDarkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        roundEdgeButton(title: '4'),
                        roundEdgeButton(title: '5'),
                        roundEdgeButton(title: '6'),
                        roundEdgeButton(
                            title: '-',
                            textColor:
                                kDarkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        roundEdgeButton(title: '1'),
                        roundEdgeButton(title: '2'),
                        roundEdgeButton(title: '3'),
                        roundEdgeButton(
                            title: '+',
                            textColor:
                                kDarkMode ? Colors.green : Colors.redAccent)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        roundEdgeButton(title: '0'),
                        roundEdgeButton(title: '.'),
                        roundEdgeButton(
                            icon: Icons.backspace_outlined,
                            iconColor:
                                kDarkMode ? Colors.green : Colors.redAccent),
                        GestureDetector(
                          onTap: () {
                            calculate();
                          },
                          child: roundEdgeButton(
                              title: '=',
                              textColor:
                                  kDarkMode ? Colors.green : Colors.redAccent),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget roundEdgeButton(
      {String? title,
      double padding = 16,
      IconData? icon,
      Color? iconColor,
      Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          if (title == 'C') {
            setState(
              () {
                kUserQuestion = '';
                kUserAnswer = '';
              },
            );
          } else if (icon == Icons.backspace_outlined) {
            setState(
              () {
                kUserQuestion =
                    kUserQuestion.substring(0, kUserQuestion.length - 1);
              },
            );
          } else if (title == '=') {
            setState(
              () {
                calculate();
              },
            );
          } else {
            setState(
              () {
                kUserQuestion += title!;
              },
            );
          }
        },
        child: MyContainer(
          darkMode: kDarkMode,
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
                        color: textColor ??
                            (kDarkMode ? Colors.white : Colors.black),
                        fontSize: 30,
                      ),
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                      size: 30,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchThemeMode() {
    return MyContainer(
      darkMode: kDarkMode,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.wb_sunny,
              color: kDarkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: kDarkMode ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
