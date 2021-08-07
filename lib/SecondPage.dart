import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key key, this.total}) : super(key: key);
  final int total;

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _counter1 = 1;
  int _counter2 = 1;
  int playerTurn = Random().nextInt(2) + 1;

  void _rollDice() {
    setState(() {
      var randomDiceValue = Random().nextInt(6) + 1;
      if (playerTurn == 1) {
        if (_counter1 < widget.total) {
          if (randomDiceValue == 6) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Player 1 rolled a 6"),
                duration: Duration(milliseconds: 800),
              ),
            );
            _counter1 = _counter1 + 6;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Player 1 Throw Again"),
                duration: Duration(milliseconds: 800),
              ),
            );
          } else {
            print("Add the rolled value to Player 1");
            _counter1 = _counter1 + randomDiceValue;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Dice :- $randomDiceValue \n--Player 2 turn--",maxLines: 2,),
                duration: Duration(milliseconds: 800),
              ),
            );
            playerTurn++;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Player 1 Winner"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        if (_counter2 < widget.total) {
          if (randomDiceValue == 6) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Player 2 rolled a 6"),
                duration: Duration(milliseconds: 800),
              ),
            );
            _counter2 = _counter2 + 6;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Player 2 Throw Again"),
                duration: Duration(milliseconds: 800),
              ),
            );
          } else {
            print("Add the rolled value to Player 2");
            _counter2 = _counter2 + randomDiceValue;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Dice :- $randomDiceValue \n--Player 1 Turn --",maxLines: 2,),
                duration: Duration(milliseconds: 800),
              ),
            );
            playerTurn--;
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Player 2 Winner"),
              backgroundColor: Colors.red,
            ),
          );
        }
      }


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Roll the dice"),backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color:
                      (playerTurn == 1) ? Colors.amber : Colors.blue.shade400,
                  border: Border.all(
                    color:
                        (playerTurn == 1) ? Colors.white : Colors.transparent,
                    width: 10,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Player 1 Total',
                    ),
                    Text(
                      "$_counter1/${widget.total}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    (playerTurn == 1)
                        ? Text("Player 1 Turn")
                        : Text("Opponent's Turn"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, onPrimary: Colors.white, elevation: 0),
                icon: Image.asset("images/dice.png"),
                onPressed: () {
                  _rollDice();
                },
                label: Text("Roll"),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color:
                      (playerTurn == 2) ? Colors.purple : Colors.green.shade400,
                  border: Border.all(
                    color:
                        (playerTurn == 2) ? Colors.white : Colors.transparent,
                    width: 10,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Player 2 Total',
                    ),
                    Text(
                      "$_counter2/${widget.total}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    (playerTurn == 2)
                        ? Text("Player 2 Turn")
                        : Text("Opponent's Turn"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
