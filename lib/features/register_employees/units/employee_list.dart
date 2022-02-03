part of '../view.dart';

class _EmployeesListUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = EmployeeCubit.of(context);

    Stream<QuerySnapshot<Object?>> stream =
        FirebaseFirestore.instance.collection('users').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            //
            return SizedBox(
              height: 300,
              child: CircularIndicator(
                color: kBlueClr,
              ),
            );
            //
          } else if (snapShot.connectionState == ConnectionState.active) {
            //
            if (snapShot.data!.docs.isNotEmpty) {
              return ListView.builder(
                  padding: kPadding1(0, 20),
                  itemCount: snapShot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final _userData = snapShot.data!.docs[index];

                    return CustomCard(
                      onTap: () {
                        MagicRoute.navigateTo(
                          ProfileView(
                            _userData['id'],
                          ),
                        );
                      },
                      onLongPress: null,
                      imageUrl: snapShot.connectionState == ConnectionState.none
                          ? Image.asset('assets/images/man.png')
                          : Image.network(
                              _userData['userImageUrl'],
                              fit: BoxFit.cover,
                            ),
                      title: _userData['userName'],
                      description: _userData['jobPosition'] +
                          ' ' +
                          _userData['phoneNumber'],
                      trailling: CustomTextButton(
                          onTap: () =>
                              cubit.sendEmailMessage(_userData['email']),
                          child: Icon(
                            FontAwesomeIcons.envelope,
                            color: kBlueClr.withOpacity(0.8),
                            size: 30,
                          )),
                    );
                  });
            }
            //
            else {
              return ErrorMessage(
                text: 'there is no data to display ',
                imageUrl: 'assets/images/warning.png',
              );
            }
          }
          //
          return ErrorMessage(
            text: 'something went wrong',
            imageUrl: 'assets/images/xxx.png',
          );
        });
  }
}
