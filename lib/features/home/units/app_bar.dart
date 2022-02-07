part of '../view.dart';

class _AppBarUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final cubit = HomeCubit.of(context);
    return AppBar(
      backgroundColor: kBlueClr,
      elevation: 0,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Icon(
            FontAwesomeIcons.listUl,
            color: kGreyClr,
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
            onPressed: () => _showFilterDialog(context),
            icon: Icon(
              FontAwesomeIcons.filter,
              color: kGreyClr,
            )),
        SizedBox(width: 20)
      ],
    );
  }
}
