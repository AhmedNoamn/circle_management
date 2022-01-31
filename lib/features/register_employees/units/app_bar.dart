part of '../view.dart';

class _AppBarUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBlueClr,
      elevation: 0,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Icon(
            FontAwesomeIcons.alignLeft,
            color: kGreyClr,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      title: Text(
        'Employees ',
        style: style2,
      ),
    );
  }
}
