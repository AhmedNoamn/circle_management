part of 'view.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInit());

  static HomeCubit of(context) => BlocProvider.of(context);

  String? taskCategory;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void FilterResult(String? value) {
    taskCategory = value;

    emit(HomeInit());
  }

  void deleteTask(String taskId, String userId) {
    emit(HomeLoading());
    final User? _user = _auth.currentUser;
    final userID = _user!.uid;
    if (userID == userId) {
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
