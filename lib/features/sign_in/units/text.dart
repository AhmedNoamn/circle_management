part of '../view.dart';

class _TextUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: sizeHeight(context, 10)),
        Text(
          'LOGIN ',
          style: style1,
        ),
        Text(
          '    Manage your Business',
          style: style3,
        ),
      ],
    );
  }
}
