import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
      height: 200.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(20),
        //   bottomRight: Radius.circular(20),
        // ),
        color: Color(0xFF8419FF),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Entrance Prepartion",
                  style: Theme.of(context).textTheme.titleLarge),
              Text("Today's Goal 20 Questions",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
