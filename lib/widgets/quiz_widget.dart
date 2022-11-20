import 'package:entrance_prep/constants/color.dart';
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
  final String groupValue;
  final String value;
  final ValueChanged<String> onChanged;

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
                child: Radio<String>(
                  visualDensity: VisualDensity.compact,
                  activeColor: Colors.white,
                  groupValue: groupValue,
                  value: value,
                  onChanged: (String? newValue) {
                    onChanged(newValue!);
                  },
                ),
              ),
              Text(
                "${index + 1}.   ${label}",
                style: TextStyle(
                  color: value == groupValue ? Colors.white : Colors.black,
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
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
              return LabeledRadio(
                  index: index,
                  label: widget.quizzes.options[index],
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  value: widget.quizzes.options[index],
                  groupValue: widget.overAllValues[widget.quizzes.question],
                  onChanged: (val) =>
                      widget.callback(widget.quizzes.question, val.toString()));
            },
          ),
        )
      ]),
    );
  }
}
