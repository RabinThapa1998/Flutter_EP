import 'package:entrance_prep/constants/color.dart';
import 'package:entrance_prep/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnrollBottomSheet extends StatefulWidget {
  const EnrollBottomSheet({Key? key}) : super(key: key);

  @override
  _EnrollBottomSheetState createState() => _EnrollBottomSheetState();
}

class _EnrollBottomSheetState extends State<EnrollBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
      ),
      child: Row(
        children: [
          CustomIconButton(
            onTap: () {},
            height: 45.h,
            width: 45.w,
            child: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 30.sp,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: CustomIconButton(
              onTap: () {},
              color: kPrimaryColor,
              height: 45.h,
              width: 45.w,
              child: Text(
                "Enroll Now",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
