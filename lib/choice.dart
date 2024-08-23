import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class Choice extends StatefulWidget {
  String choiceText;
  bool isCorrect;

  final Function onPressed;
  Choice(
      {super.key,
      required this.choiceText,
      required this.isCorrect,
      required this.onPressed});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  Color buttonColor = Colors.blue;
  late Color buttonEvaluationColor;
  bool isSelected = false;
  late Model model;

  void addToScoreBar() {
    if (widget.isCorrect) {
      model.scoreBarItems.add(Icon(Icons.check));
    } else {
      model.scoreBarItems.add(Icon(Icons.close));
    }
  }

  @override
  void initState() {
    buttonEvaluationColor = widget.isCorrect ? Colors.green : Colors.red;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    model = Provider.of<Model>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<Model, bool>(
        selector: (context, selectorP) => selectorP.clickable,
        builder: (context, clickable, child) {
          return SizedBox(
            width: 120,
            height: 50,
            child: MaterialButton(
              onPressed: clickable
                  ? () async {
                      setState(() {
                        buttonColor =
                            widget.isCorrect ? Colors.green : Colors.red;
                        isSelected = true;
                      });

                      model.score = widget.isCorrect
                          ? model.score + 100
                          : model.score - 100;

                      addToScoreBar();

                      model.updateClickable();

                      // Adding a delay after UI update
                      await Future.delayed(const Duration(milliseconds: 1500));

                      model.updateClickable();
                      widget.onPressed();
                    }
                  : null,
              color: buttonColor,
              disabledColor: buttonEvaluationColor,
              child: Text(widget.choiceText),
            ),
          );
        });
  }
}
