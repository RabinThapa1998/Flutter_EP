import 'package:entrance_prep/controller/set.controller.dart';
import 'package:entrance_prep/widgets/back_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);

  final SetDetailsController setdetailscontroller =
      Get.put(SetDetailsController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            body: SafeArea(
          // bottom: false,
          child: Column(
            children: [
              BackButtonWidget(
                title: "Result",
              ),
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${index + 1}.",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  setdetailscontroller
                                      .questions[index].question,
                                ),
                                Text(
                                  setdetailscontroller
                                              .questions[index].selected !=
                                          null
                                      ? setdetailscontroller
                                          .questions[index]
                                          .options[setdetailscontroller
                                              .questions[index].selected]
                                          .option
                                      : "Not Answered",
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: setdetailscontroller.questions.length,
                  ),
                );
              })
            ],
          ),
        )));
  }
}
