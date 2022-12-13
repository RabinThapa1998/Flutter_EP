import 'package:entrance_prep/controller/set.controller.dart';
import 'package:entrance_prep/models/course.dart';
import 'package:entrance_prep/widgets/back_button_widget.dart';
import 'package:entrance_prep/widgets/course_container.dart';
import 'package:entrance_prep/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final SetController setcontroller = Get.put(SetController());

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonWidget(
                  title: "tests",
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      separatorBuilder: (_, __) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      shrinkWrap: true,
                      itemBuilder: (_, int index) {
                        return CourseContainer(
                          eachSet: setcontroller.setsList[index],
                        );
                      },
                      itemCount: setcontroller.setsList.length,
                    ),
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
