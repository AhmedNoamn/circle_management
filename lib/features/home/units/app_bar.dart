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
            FontAwesomeIcons.listUl,
            color: kWhiteClr,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      }),
      title: Text(
        'Tasks',
        style: style2,
      ),
      actions: [
        IconButton(
            onPressed: () {
              _showFilterDialog(context);
            },
            icon: Icon(
              FontAwesomeIcons.filter,
              color: kWhiteClr,
            )),
        SizedBox(width: 20)
      ],
    );
  }
}
