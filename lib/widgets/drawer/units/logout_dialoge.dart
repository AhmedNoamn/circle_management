part of '../drawer.dart';

Future<void> _showLogOutDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => _LogOutDialog(),
  );
}

class _LogOutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _authInit = FirebaseAuth.instance;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: radius15,
        //radius15,
      ),
      titlePadding: EdgeInsets.all(0),
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          color: kBlueClr,
        ),
        padding: kPadding3,
        child: Row(
          children: [
            Text(
              'Log Out',
              style: style2,
            ),
            SizedBox(width: 20),
            Icon(
              FontAwesomeIcons.signOutAlt,
              color: kGreyClr,
            ),
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Do yo wanna  log out ?',
            style: style3,
          ),
          Divider(
            height: 40,
            thickness: 3,
            color: kGreyClr,
          )
        ],
      ),
      actions: [
        CustomTextButton(
          onTap: () => MagicRoute.pop(),
          child: Text(
            'Close ',
            style: style3,
          ),
        ),
        CustomTextButton(
          onTap: () async {
            await _authInit.signOut();
            MagicRoute.pop();
            MagicRoute.navigateAndReplacement(SignInView());
          },
          child: Text(
            'Log Out ',
            style: style3.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
