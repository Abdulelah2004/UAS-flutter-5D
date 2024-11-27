import 'dart:math';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class DicePage extends StatefulWidget {
  final String player1Name;
  final String player2Name;

  const DicePage({
    Key? key,
    required this.player1Name,
    required this.player2Name,
  }) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left_dice_number = 1;
  int right_dice_number = 1;
  int score_player1 = 0;
  int score_player2 = 0;

  ConfettiController? _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: Duration(seconds: 3));
  }

  void DiceFaceChange() {
    setState(() {
      left_dice_number = Random().nextInt(6) + 1;
      right_dice_number = Random().nextInt(6) + 1;

      score_player1 += left_dice_number;
      score_player2 += right_dice_number;
    });
  }

  void checkWinner() {
    if (score_player1 >= 50 || score_player2 >= 50) {
      _confettiController?.play();
      String winner =
          score_player1 >= 50 ? widget.player1Name : widget.player2Name;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "🎉 Congratulations! 🎉",
              textAlign: TextAlign.center,
            ),
            content: Text(
              "$winner wins the game!",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Abdulelah Game',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 30.0),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        children: [
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          widget.player1Name,
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 28.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          "VS",
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          widget.player2Name,
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 28.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              DiceFaceChange();
                              checkWinner();
                            },
                            child:
                                Image.asset('images/dice$left_dice_number.png'),
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              DiceFaceChange();
                              checkWinner();
                            },
                            child: Image.asset(
                                'images/dice$right_dice_number.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Score: $score_player1",
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 28.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Text(
                          "Score: $score_player2",
                          style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 28.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: _confettiController!,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              colors: [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.yellow,
                Colors.purple
              ],
            ),
          ),
        ],
      ),
    );
  }
}
