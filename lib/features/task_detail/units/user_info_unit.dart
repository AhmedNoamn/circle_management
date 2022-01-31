part of '../view.dart';

class _UserData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(
        //   'Updated by ',
        //   style: style3.copyWith(fontSize: 19),
        // ),
        // Spacer(),
        CircleAvatar(
          radius: 27,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/images/man.png',
          ),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Updated user ',
              style: style3,
            ),
            SizedBox(height: 10),
            Text(
              '  Updated position ',
              style: style3.copyWith(color: kDarkClr.withOpacity(0.5)),
            ),
          ],
        )
      ],
    );
  }
}
