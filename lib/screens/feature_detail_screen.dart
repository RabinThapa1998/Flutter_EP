import 'package:entrance_prep/widgets/back_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeatureDetailScreen extends StatelessWidget {
  const FeatureDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10.w),
      child: Row(
        children: [
          OldSetCardWidget(context),
          OldSetCardWidget(context),
          OldSetCardWidget(context),
          OldSetCardWidget(context),
        ],
      ),
    ));
  }

  Container OldSetCardWidget(BuildContext context) {
    return Container(
        width: 150.w,
        height: 200.h,
        padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.sp),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                blurRadius: 4.0.sp,
                spreadRadius: .05.sp,
              ),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/icons/mbbs1.svg",
                  height: 120.h,
                  width: 120.w,
                )),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Old Sets 2078",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ));
  }
}
