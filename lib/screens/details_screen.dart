import 'package:entrance_prep/models/quiz.dart';
import 'package:entrance_prep/screens/result_screen.dart';
import 'package:entrance_prep/widgets/back_button_widget.dart';
import 'package:entrance_prep/widgets/custom_icon_button.dart';
import 'package:entrance_prep/widgets/quiz_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  const DetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String eachGroupValue = '';
  late var overAllValues = new Map();

  void handleRadioChange(String quest, String ans) {
    setState(() {
      overAllValues[quest] = ans;
    });
    print("overAllValues" + overAllValues.toString());
  }

  @override
  initState() {
    super.initState();
    for (var i = 0; i < Quizzes.length; i++) {
      overAllValues[Quizzes[i].question] = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButtonWidget(
                title: widget.title,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                separatorBuilder: (_, __) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                shrinkWrap: true,
                itemBuilder: (_, int index) {
                  return QuizWidget(
                      quizzes: Quizzes[index],
                      overAllValues: overAllValues,
                      callback: handleRadioChange);
                },
                itemCount: Quizzes.length,
              )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                results: overAllValues,
                              )),
                    );
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
