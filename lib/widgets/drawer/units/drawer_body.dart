part of '../drawer.dart';

class _DrawerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? _user = _auth.currentUser;
    final userId = _user!.uid;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          ListTileUnit(
              onTap: () {
                MagicRoute.pop();
                MagicRoute.navigateAndPopUntilFirstPage(HomeView());
              },
              leading: Icon(FontAwesomeIcons.folderOpen),
              title: Text(
                'projects',
                style: style3,
              )),
          ListTileUnit(
              onTap: () {
                MagicRoute.pop();
                MagicRoute.navigateAndPopUntilFirstPage(ProfileView(userId));
              },
              leading: Icon(FontAwesomeIcons.userCircle),
              title: Text(
                'My Account',
                style: style3,
              )),
          ListTileUnit(
              onTap: () {
                MagicRoute.pop();
                MagicRoute.navigateAndPopUntilFirstPage(RegisterWorkerView());
              },
              leading: Icon(FontAwesomeIcons.users),
              title: Text(
                'Registered Employees',
                style: style3,
              )),
          ListTileUnit(
              onTap: () {
                MagicRoute.pop();
                MagicRoute.navigateAndPopUntilFirstPage(AddTaskView());
              },
              leading: Icon(FontAwesomeIcons.folderPlus),
              title: Text(
                'Add Task',
                style: style3,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              thickness: 3,
              color: kGreyClr,
            ),
          ),
          ListTileUnit(
            leading: Icon(FontAwesomeIcons.signOutAlt),
            title: Text(
              'Log Out',
              style: style3,
            ),
            onTap: () {
              MagicRoute.pop();
              _showLogOutDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
