import 'package:flutter/material.dart';

class BackImageUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/wall.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
// class BackImageUnit extends StatefulWidget {
//   @override
//   _BackImageUnitState createState() => _BackImageUnitState();
// }

// class _BackImageUnitState extends State<BackImageUnit>
//     with TickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation _animation;
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 0),
//     );
//     _animation = CurvedAnimation(
//       parent: _animationController,
//       curve: Curves.linear,
//     )
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((animationStatus) {
//         if (animationStatus == AnimationStatus.completed) {
//           _animationController.reset();
//           _animationController.forward();
//         }
//       });
//     _animationController.forward();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       'assets/images/wall.jpg',
//       fit: BoxFit.cover,
//       width: double.infinity,
//       height: double.infinity,
//       alignment: FractionalOffset(_animation.value, 0),
//     );
//   }
// }
