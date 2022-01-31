part of '../view.dart';

class _TextUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: sizeHeight(context, 30)),
        IconButton(
          onPressed: () => MagicRoute.pop(),
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 30,
          ),
        ),
        SizedBox(height: sizeHeight(context, 10)),
        Text(
          'Forgot PAssword',
          style: style1,
        ),
        SizedBox(height: sizeHeight(context, 20)),
        Text(
          'Enter E-mail',
          style: style3,
        ),
      ],
    );
  }
}
