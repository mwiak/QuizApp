import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'model.dart';
import 'play_menu.dart';

void main() // the start point of a Dart program.
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // the root of a flutter application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Model(),
      child: const MaterialApp(
        title: 'Quiz App',
        home: PlayScreen(),
      ),
    );
  }
}
