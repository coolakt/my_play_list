import 'package:flutter/material.dart';
import 'package:my_play_list/music_list.dart';
import 'package:my_play_list/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const MusicList(),
        "/player": (context) => const Player(),
      },
    );
  }
}
