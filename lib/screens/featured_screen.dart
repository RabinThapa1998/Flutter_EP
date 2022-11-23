import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:entrance_prep/widgets/appbar_widget.dart';
import 'package:entrance_prep/widgets/featured_screen_body_widget.dart';

class FeaturedScreen extends StatefulWidget {
  FeaturedScreen({Key? key}) : super(key: key);

  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
              child: Column(children: [AppBarWidget(), FeaturedBodyWidget()])),
        )));
  }
}
