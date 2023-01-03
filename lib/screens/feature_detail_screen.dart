import 'package:entrance_prep/widgets/back_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeatureDetailScreen extends StatelessWidget {
  const FeatureDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        BackButtonWidget(title: "MBBS"),
        Container(child: Text("Hello World"))
      ]),
    );
  }
}
