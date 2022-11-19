import 'package:entrance_prep/models/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final Quiz quizzes;

  QuizWidget({Key? key, required this.quizzes}) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  String groupValue = '';

  void handleRadioChange(Object val) {
    print(val);
    setState(() {
      groupValue = val.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Text(
          widget.quizzes.question,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: false,
            itemCount: widget.quizzes.options.length,
            itemBuilder: (context, index) {
              return ListTile(
                visualDensity: VisualDensity(vertical: -4),
                title: Text(widget.quizzes.options[index],
                    style: Theme.of(context).textTheme.bodySmall),
                leading: Radio(
                    value: widget.quizzes.options[index],
                    groupValue: groupValue,
                    onChanged: (val) => handleRadioChange(val!)),
              );
            },
          ),
        )
      ]),
    );
  }
}
