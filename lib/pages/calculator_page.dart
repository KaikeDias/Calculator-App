// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget numButton(String btnText, Color btnColor, Color txtColor) {
    return ElevatedButton(
      onPressed: () {
        calculate(btnText);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(70, 70),
        shape: CircleBorder(),
        backgroundColor: btnColor,
      ),
      child: Text(
        btnText,
        style: TextStyle(
          fontSize: 25,
          color: txtColor,
        ),
      ),
    );
  }

  Widget buttonSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                text,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.white, fontSize: 80),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton("C", Colors.grey, Colors.black),
            numButton("+/-", Colors.grey, Colors.black),
            numButton("%", Colors.grey, Colors.black),
            numButton("/", Colors.orange, Colors.white),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton("7", (Colors.grey[850])!, Colors.white),
            numButton("8", (Colors.grey[850])!, Colors.white),
            numButton("9", (Colors.grey[850])!, Colors.white),
            numButton("x", Colors.orange, Colors.white),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton("4", (Colors.grey[850])!, Colors.white),
            numButton("5", (Colors.grey[850])!, Colors.white),
            numButton("6", (Colors.grey[850])!, Colors.white),
            numButton("-", Colors.orange, Colors.white),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            numButton("1", (Colors.grey[850])!, Colors.white),
            numButton("2", (Colors.grey[850])!, Colors.white),
            numButton("3", (Colors.grey[850])!, Colors.white),
            numButton("+", Colors.orange, Colors.white),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                calculate('0');
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: (Colors.grey[850])!,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 12, 90, 12),
                child: Text(
                  "0",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            numButton(".", (Colors.grey[850])!, Colors.white),
            numButton("=", Colors.orange, Colors.white),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buttonSection(),
          ],
        ),
      ),
    );
  }

  // Logic
  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "";
  String operation = "";

  void calculate(String btnText) {
    if (btnText == "C") {
      result = "";
      text = "";
      firstNumber = 0;
      secondNumber = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      firstNumber = int.parse(text);
      result = "";
      operation = btnText;
    } else if (btnText == "=") {
      secondNumber = int.parse(text);
      if (operation == "+") {
        result = (firstNumber + secondNumber).toString();
      } else if (operation == "-") {
        result = (firstNumber - secondNumber).toString();
      } else if (operation == "x") {
        result = (firstNumber * secondNumber).toString();
      } else if (operation == "/") {
        result = (firstNumber ~/ secondNumber).toString();
      }
    } else {
      result = int.parse(text + btnText).toString();
    }
    setState(() {
      text = result;
    });
  }
}
