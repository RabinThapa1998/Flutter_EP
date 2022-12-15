import 'package:entrance_prep/constants/color.dart';
import 'package:entrance_prep/models/get-one-set.model.dart';
import 'package:entrance_prep/models/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void QuizOnChangeCallback(String quest, String ans);

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.index,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  });

  final int index;
  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: value == groupValue ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            children: <Widget>[
              Visibility(
                visible: false,
                child: Radio<int>(
                  visualDensity: VisualDensity.compact,
                  activeColor: Colors.white,
                  groupValue: groupValue,
                  value: value,
                  onChanged: (newValue) {
                    onChanged(newValue!);
                  },
                ),
              ),
              Expanded(
                child: Text(
                  "${index + 1}.   ${label}",
                  style: TextStyle(
                    color: value == groupValue ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizWidget extends StatefulWidget {
  final Question questions;
  final QuizOnChangeCallback callback;

  QuizWidget({Key? key, required this.questions, required this.callback})
      : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(children: [
        Text(
          widget.questions.question,
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
            itemCount: widget.questions.options.length,
            itemBuilder: (context, idx) {
              return LabeledRadio(
                  index: idx,
                  label: widget.questions.options[idx].option,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  value: widget.questions.options[idx].index,
                  groupValue: widget.questions.correct,
                  onChanged: (val) => widget.callback(widget.questions.question,
                      widget.questions.options[val].option));
            },
          ),
        )
      ]),
    );
  }
}
