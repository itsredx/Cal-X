import 'package:flutter/material.dart';
import 'components/mycontainer.dart';
import 'constants.dart';
import 'calculatorBrain/CalculatorBrain.dart';





class RoundedEdgeButton extends StatefulWidget {

  final String? title;
  final double padding = 17;
  final IconData? icon;
  final Color? iconColor;
  final Color? textColor;

  const RoundedEdgeButton({Key? key, this.title, this.icon, this.iconColor, this.textColor}) : super(key: key);

  @override
  State<RoundedEdgeButton> createState() => _RoundedEdgeButtonState();
}

class _RoundedEdgeButtonState extends State<RoundedEdgeButton> {

  get padding => widget.padding;
  get title => widget.title;
  get textColor => widget.textColor;
  get icon => widget.icon;
  get iconColor => widget.iconColor;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          if (title == 'C') {
            setState(() {
              kUserQuestion = '';
              kUserAnswer = '';
            });
          } else if (icon == Icons.backspace_outlined) {
            setState(() {
              kUserQuestion =
                  kUserQuestion.substring(0, kUserQuestion.length - 1);
            });
          } else if (title == '=') {
            setState(() {
              calculate();
            });
          } else {
            setState(() {
              kUserQuestion += title!;
            });
          }
        },
        child: MyContainer(
          darkMode: kDarkMode,
          borderRadius: BorderRadius.circular(25),
          padding: EdgeInsets.all(widget.padding),
          child: SizedBox(
            width: padding * 2,
            height: padding * 2,
            child: Center(
                child: title != null
                    ? Text(
                  title!,
                  style: TextStyle(
                      color: textColor ?? (kDarkMode
                          ? Colors.white
                          : Colors.black),
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
}
