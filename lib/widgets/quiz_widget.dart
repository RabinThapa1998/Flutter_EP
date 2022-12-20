import 'package:entrance_prep/constants/color.dart';
import 'package:entrance_prep/models/get-one-set.model.dart';
import 'package:entrance_prep/models/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: value == groupValue ? kPrimaryColor : Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Visibility(
              visible: true,
              child: Radio<String>(
                visualDensity: VisualDensity.compact,
                activeColor: Colors.white,
                groupValue: groupValue,
                value: value,
                onChanged: (newValue) {
                  print("newValue" + value!);
                  print("groupValue" + groupValue!);
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
    );
  }
}

class QuizWidget extends StatefulWidget {
  final Question questions;
  final QuizOnChangeCallback callback;
  final Map overAllValues;
  QuizWidget(
      {Key? key,
      required this.questions,
      required this.callback,
      required this.overAllValues})
      : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(children: [
        Text(
          widget.questions.question,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
              shrinkWrap: false,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.questions.options.length,
              itemBuilder: (context, idx) {
                return LabeledRadio(
                    index: idx,
                    label: widget.questions.options[idx].option,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    value: widget.questions.options[idx].option,
                    groupValue: widget.overAllValues[widget.questions.question],
                    onChanged: (val) =>
                        widget.callback(widget.questions.question, val));
              }),
        )
      ]),
    );
  }
}
