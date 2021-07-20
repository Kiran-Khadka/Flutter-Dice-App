import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green, // background color of the scaffold
        appBar: AppBar(
          title: Text("Dice App"),
          backgroundColor: Colors.deepOrange,
        ),
        body: DicePage(),
      ),
    );
  }
}

// body of the App
// class DicePage is immutable meaning all the widgets will be placed on defined area
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // variable declaration outside of the build method incase of stateless widget
  // donot reflects the change
  var leftDiceNumber = 1; // variable declaration
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            ////flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  setState(() { // onPresed change the state which here is to set the variable leftDiceNumber=4
                    leftDiceNumber =
                        4; // when pressed DiceNumber value is set to 4 which becomes dice4.png
                    print("Dice Number = $leftDiceNumber");
                  });
                },
                child: Image(
                  // Image widget wrapped with Expanded
                  image: AssetImage(
                      "assets/images/dice$leftDiceNumber.png"), // this will beceome "assets/images/dice5.png"
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                  // flat button is replaced with text button
                  onPressed: () {
                    print("Right Button got pressed");
                  },
                  child: Image.asset("assets/images/dice1.png")),
            ),
          ),
        ],
      ),
    );
  }
}
