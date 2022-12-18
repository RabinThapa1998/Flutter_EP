import 'package:entrance_prep/screens/details_screen.dart';
import 'package:entrance_prep/widgets/custom_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackButtonWidget extends StatelessWidget {
  final String title;

  const BackButtonWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [
          Align(
            child: Text(
              "${title}",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Positioned(
              left: 0,
              child: CustomIconButton(
                  child: Icon(Icons.arrow_back),
                  height: 35.h,
                  width: 35.w,
                  onTap: () => Navigator.pop(context)))
        ],
      ),
    );
  }
}
