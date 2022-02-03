import 'package:circle_management/constant.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            Text(
              'Please wait while Loading.... ',
              style: style1,
            ),
          ],
        ));
  }
}

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({this.color});

  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? kGreyClr,
      ),
    );
  }
}
