part of '../view.dart';

class _AppBarUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: kGreyClr.withOpacity(0),
        leading: TextButton(
            onPressed: () => MagicRoute.pop(),
            child: Text(
              'Back',
              style: style3.copyWith(
                fontStyle: FontStyle.italic,
              ),
            )));
  }
}
