part of 'view.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);
  // String taskSearchCategory = '';

  String? currentUse;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void passCurrentUser() {
    final User? _user = _auth.currentUser;
    final _uId = _user!.uid;

    currentUse = _uId;

    emit(HomeInit());
  }

  Stream<QuerySnapshot> getAlldataStream() async* {
    var _stream = FirebaseFirestore.instance
        .collection('tasks')
        .orderBy('taskCreatedDate', descending: true)
        .snapshots();

    yield* _stream;
  }

  // Stream<QuerySnapshot> getSearchedDataStream() async* {
  //   var _searchStream = FirebaseFirestore.instance
  //       .collection('tasks')
  //       .where(
  //         'taskCategory'.toLowerCase(),
  //         arrayContains: taskSearchCategory,
  //       )
  //       .orderBy('taskCreatedDate', descending: true)
  //       .snapshots();
  //   yield* _searchStream;
  // }

  void deleteTask(String taskId, String userId) async {
    emit(HomeLoading());

    final User? _user = _auth.currentUser;
    final _uId = _user!.uid;

    if (_uId == userId) {
      FirebaseFirestore.instance
          .collection('tasks')
          .doc(
            taskId,
          )
          .delete();

      showSnackBar('task deleted successfully');
    } else {
      showSnackBar('not allowed to delete this task');
    }

    emit(HomeInit());
  }
}
