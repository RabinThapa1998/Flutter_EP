import 'package:entrance_prep/models/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void QuizOnChangeCallback(String quest, String ans);

class QuizWidget extends StatefulWidget {
  final Quiz quizzes;
  final Map overAllValues;

  final QuizOnChangeCallback callback;

  QuizWidget(
      {Key? key,
      required this.quizzes,
      required this.overAllValues,
      required this.callback})
      : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          widget.quizzes.question,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          child: ListView.builder(
            shrinkWrap: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.quizzes.options.length,
            itemBuilder: (context, index) {
              return ListTile(
                visualDensity: VisualDensity(vertical: -4),
                title: Text(widget.quizzes.options[index],
                    style: Theme.of(context).textTheme.bodySmall),
                leading: Radio(
                    value: widget.quizzes.options[index],
                    groupValue: widget.overAllValues[widget.quizzes.question],
                    onChanged: (val) => widget.callback(
                        widget.quizzes.question, val.toString())),
              );
            },
          ),
        )
      ]),
    );
  }
}
