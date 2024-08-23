import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'question.dart';
import 'choice.dart';
import 'results.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late Question q1;
  late Question q2;
  late List qeue = [];
  int currentQuestion = 0;
  List<Widget> scoreBar = [];
  late Model model;

  void addToScoreBar() {}

  List<Widget> generateChoices(int questionNumber) {
    List<Widget> choices = [];
    for (var choice in qeue[questionNumber].choices) {
      var generatedChoice = Choice(
          key: UniqueKey(),
          choiceText: choice.keys.first,
          isCorrect: choice.values.first,
          onPressed: nextQuestion);
      choices.add(generatedChoice);
    }
    return choices;
  }

  void nextQuestion() async {
    if (currentQuestion < qeue.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Results()),
      );
    }
  }

  String generateQuestionText() {
    return qeue[currentQuestion].title;
  }

  @override
  void dispose() {
    model.scoreBarItems = [];
    model.score = 0;
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = Provider.of<Model>(context);
  }

  @override
  void initState() {
    q1 = Question(id: 1, title: 'what is the capital of Syria', choices: [
      {'Cairo': false},
      {'Riyad': false},
      {'Beyrout': false},
      {'Damascus': true},
    ]);
    q2 = Question(id: 2, title: 'what is the capital of Germany', choices: [
      {'Frankfurt': false},
      {'Hamburg': false},
      {'Berlin': true},
      {'Meinz': false},
    ]);
    qeue.add(q1);
    qeue.add(q2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: Center(child: Text(generateQuestionText()))),
                  )),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisSpacing: 50,
                    mainAxisSpacing: 50,
                    crossAxisCount: 2,
                    children: generateChoices(currentQuestion),
                  ),
                ),
              ),
              Expanded(child: Text('Score: ' + model.score.toString())),
              Row(
                children: model.scoreBarItems,
              )
            ],
          ),
        ),
      ),
    );
  }
}
