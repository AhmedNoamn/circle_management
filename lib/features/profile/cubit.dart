part of 'view.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInit());

  static ProfileCubit of(context) => BlocProvider.of(context);

  late String userName;
  late String email;
  late String userImageUrl;
  late String phoneNumber;
  late String jobPosition;
  late String userJoinedDate;
  bool isCurrentUser = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void getUserData(String userId) async {
    emit(ProfileLoading());
    try {
      final DocumentSnapshot? _userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (_userData == null) {
        return;
      } else {
        userName = _userData.get('userName');
        email = _userData.get('email');
        userImageUrl = _userData.get('userImageUrl');
        phoneNumber = _userData.get('phoneNumber');
        jobPosition = _userData.get('jobPosition');
        Timestamp joinedtime = _userData.get('userJoinedTime');
        var joinedDate = joinedtime.toDate();
        userJoinedDate =
            '${joinedDate.day}/ ${joinedDate.month}/ ${joinedDate.year}';

        final User? _user = _auth.currentUser;
        final _uid = _user!.uid;

        isCurrentUser = _uid == userId;
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(ProfileInit());
  }

  Future<void> sendMessageOrCallEmployee(String url) async {
    try {
      emit(ProfileLoading());
      await launch(url);
      MagicRoute.navigateAndPopAll(RegisterEmployeeView());
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}
