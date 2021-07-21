import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

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
        body: DicePage(),  // DicePage Widget class
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
  var rightDiceNumber = 1;

  void changeDiceFace() {  // function to change the dice face 
    setState(() {
      // onPresed change the state which here is to set the variable leftDiceNumber=4
      leftDiceNumber = Random().nextInt(6) + 1; // randomize from 1-6
      rightDiceNumber = Random().nextInt(6) +
          1; // when left dice is pressed randomize right dice
      ////print("Left Button got pressed.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            // Container for Dices
            child: Row(
              children: <Widget>[
                Expanded(
                  ////flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      onPressed: () {
                        changeDiceFace(); // call changeDiceFace
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
                          changeDiceFace();
                            // rightDiceNumber = Random().nextInt(6) +
                            //     1; // +1 is done so that generated number is never be 0
                            // leftDiceNumber = Random().nextInt(6) +
                            //     1; // when right dice is pressed randomize left dice
                            // ////print("Right Button got pressed");
                        },
                        child: Image.asset(
                            "assets/images/dice$rightDiceNumber.png")),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: Container(  // Container for displaying score
              child: Column(
                children: [
                   Text("Your Left Score is: $leftDiceNumber"),
                   Text("Your Right Score is: $rightDiceNumber"),
                ],
              ), 
            ),
          ),
        ],
      ),
    );
  }
}
