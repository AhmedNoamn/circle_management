part of '../view.dart';

class _AppBarUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kBlueClr,
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
        'Add Task',
        style: style2,
      ),
    );
  }
}
