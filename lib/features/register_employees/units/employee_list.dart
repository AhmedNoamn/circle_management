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
              child: CuirclarIndicator(
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
                      imageUrl: Image.network(
                        _userData['userImageUrl'],
                        fit: BoxFit.cover,
                      ),
                      title: _userData['userName'],
                      description: _userData['jobPosition'] +
                          ' ' +
                          _userData['phoneNumber'],
                      trailling: CustomTextButton(
                          ontap: () =>
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
              return _ErrorMessage(
                text: 'there is no data to display ',
                imageUrl: 'assets/images/warning.png',
              );
            }
          }
          //
          return _ErrorMessage(
            text: 'something went wrong',
            imageUrl: 'assets/images/xxx.png',
          );
        });
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({
    required this.text,
    required this.imageUrl,
  });

  final String text;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl),
          Text(
            text,
            style: style1,
          ),
        ],
      ),
    );
  }
}
