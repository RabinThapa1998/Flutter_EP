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

  void handleRadioChange(String quest, String ans) {
    setdetailscontroller.selectionList[quest] = ans;
  }

  @override
  initState() {
    super.initState();
    setdetailscontroller.fetchSetsDetails(setId);
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
                Obx(() {
                  return Expanded(
                    child: ListView(children: [
                      ...setdetailscontroller.questions.map((questItem) {
                        return Column(
                          children: [
                            Text(questItem.question),
                            ...questItem.options.map((opt) {
                              return ListTile(
                                title: Text(opt.option),
                                leading: Radio(
                                    value: opt.index,
                                    groupValue: questItem.selected,
                                    toggleable: true,
                                    onChanged: (val) {
                                      setState(() {
                                        questItem.selected =
                                            int.parse(val.toString());
                                      });
                                    }),
                              );
                            }).toList()
                          ],
                        );
                      }).toList()
                    ]),
                  );
                }),
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
                              Get.to(ResultScreen());
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
