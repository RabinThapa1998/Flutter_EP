import 'package:entrance_prep/constants/color.dart';
import 'package:entrance_prep/models/course.dart';
import 'package:entrance_prep/models/get-set.model.dart';
import 'package:entrance_prep/screens/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourseContainer extends StatelessWidget {
  final SetItem eachSet;
  const CourseContainer({
    Key? key,
    required this.eachSet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsScreen(
                    title: eachSet.name,
                  ))),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.asset(
            //     course.thumbnail,
            //     height: 60,
            //   ),
            // ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eachSet.name),
                  Text(
                    "Author ${eachSet.name}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // LinearProgressIndicator(
                  //   value: course.completedPercentage,
                  //   backgroundColor: Colors.black12,
                  //   color: kPrimaryColor,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
