import 'package:entrance_prep/constants/color.dart';
import 'package:entrance_prep/controller/set.controller.dart';
import 'package:entrance_prep/models/quiz.dart';
import 'package:entrance_prep/screens/result_screen.dart';
import 'package:entrance_prep/widgets/back_button_widget.dart';
import 'package:entrance_prep/widgets/custom_icon_button.dart';
import 'package:entrance_prep/widgets/quiz_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  final String title;
  final String id;
  const DetailsScreen({
    Key? key,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState(setId: this.id);
}

class _DetailsScreenState extends State<DetailsScreen> {
  String setId;
  _DetailsScreenState({required this.setId});
  final SetDetailsController setdetailscontroller =
      Get.put(SetDetailsController());

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
    setdetailscontroller.fetchSetsDetails(setId);
    print("arguments----------------------------------" + setId);

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonWidget(
                  title: widget.title,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(child: Obx(() {
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    separatorBuilder: (_, __) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    shrinkWrap: true,
                    itemBuilder: (_, int index) {
                      return QuizWidget(
                          questions: setdetailscontroller.questions[index],
                          callback: handleRadioChange);
                    },
                    itemCount: setdetailscontroller.questions.length,
                  );
                })),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 200.w,
                        height: 50.h,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: kPrimaryColor,
                                onPrimary: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0.r),
                                )),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResultScreen(
                                          results: overAllValues,
                                        )),
                              );
                            },
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
