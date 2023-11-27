import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const GuessApp());
}

class GuessApp extends StatelessWidget {
  const GuessApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Guess(),
    );
  }
}

class Guess extends StatefulWidget {
  const Guess({Key? key}) : super(key: key);

  @override
  State<Guess> createState() => _GuessState();
}

class _GuessState extends State<Guess> {
  int numar = Random().nextInt(100)+1;

  TextEditingController controller = TextEditingController();

  void verificaNumar() {
    int? numarIntrodus = int.tryParse(controller.text);
    if (numarIntrodus != null && numarIntrodus == numar) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Felicitări!'),
          content: Text('Ai ghicit numărul!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Încercați din nou.'),
          content: Text('Nu ati ghicit.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Numărul ales de mine este: $numar');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guess my number'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'I\'m thinking of a number between 1 and 100.',
            style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'It\'s your turn to guess my number!',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Try a number!',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Here',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: verificaNumar,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
