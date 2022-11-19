import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResultScreen extends StatefulWidget {
  final Map results;
  ResultScreen({Key? key, required this.results}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
            body: SafeArea(
          bottom: false,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              height: 5,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Text(widget.results.keys.elementAt(index)),
                  Text(widget.results.values.elementAt(index)),
                ],
              );
            },
            itemCount: widget.results.length,
          ),
        )));
  }
}
