import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Music Player",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
