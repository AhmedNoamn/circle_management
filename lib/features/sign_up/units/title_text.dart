part of '../view.dart';

class _TextUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: sizeHeight(context, 30)),
        Text(
          'SignUp ',
          style: style1,
        ),
        Text(
          '    Get Your Own Business',
          style: style3,
        ),
      ],
    );
  }
}
