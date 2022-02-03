part of '../view.dart';

class _CommentUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = TaskDetailCubit.of(context);

    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('tasks')
            .doc(cubit.taskID)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularIndicator();
          } else {
            if (snapshot.data == null) {
              return ErrorMessage(
                text: 'there is no data to display ',
                imageUrl: 'assets/images/warning.png',
              );
              //
            } else {
              return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final _commentData = snapshot.data!['taskComment'][index];

                  return ListTileUnit(
                    onTap: () => MagicRoute.navigateTo(
                      ProfileView(
                        _commentData['userID'],
                      ),
                    ),
                    leading: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.transparent,
                      child: snapshot.connectionState == ConnectionState.none
                          ? Image.asset(
                              'assets/images/man.png',
                            )
                          : Image.network(
                              _commentData['userImageUrl'],
                            ),
                    ),
                    title: Text(
                      _commentData['userName'],
                    ),
                    subTitle: Text(
                      _commentData['commentBody'],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 8,
                    thickness: 2,
                    color: kGreyClr,
                  ),
                ),
                itemCount: snapshot.data!['taskComment'].length,
              );
            }
          }
        });
  }
}
