import 'package:flutter/material.dart';
import 'dice_page.dart';

class PlayerInputScreen extends StatefulWidget {
  @override
  _PlayerInputScreenState createState() => _PlayerInputScreenState();
}

class _PlayerInputScreenState extends State<PlayerInputScreen> {
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Enter Player Names',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 30.0),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: player1Controller,
              decoration: InputDecoration(
                hintText: "Enter Player 1 Name",
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(height: 20),
            TextField(
              controller: player2Controller,
              decoration: InputDecoration(
                hintText: "Enter Player 2 Name",
                hintStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (player1Controller.text.isNotEmpty &&
                    player2Controller.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DicePage(
                        player1Name: player1Controller.text,
                        player2Name: player2Controller.text,
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: Text(
                'Start Game',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
