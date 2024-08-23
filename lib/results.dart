import 'package:flutter/material.dart';
import 'home_page.dart';
import 'play_menu.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SizedBox(
          width: 300,
          height: 450,
          child: Column(
            children: [
              Expanded(child: Text('Well Done')),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                    },
                    child: Text('Home'),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const PlayScreen()),
                      );
                    },
                    child: Text('Play Again'),
                  )
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}
