import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
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
              Text("Practice", style: Theme.of(context).textTheme.titleLarge),
              Text("Today's Goal 20 Questions",
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
