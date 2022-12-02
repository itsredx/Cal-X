import 'package:flutter/material.dart';
import 'mycontainer.dart';
import 'package:cal_x/constants.dart';


Widget ovalButton({required String title, double padding = 17}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: MyContainer(
      darkMode: kDarkMode,
      borderRadius: BorderRadius.circular(50),
      padding:
      EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
      child: SizedBox(
        width: padding * 2,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: kDarkMode ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}