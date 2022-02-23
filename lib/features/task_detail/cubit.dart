part of 'view.dart';

class TaskDetailCubit extends Cubit<TaskDetailStates> {
  TaskDetailCubit() : super(TaskDetailInit());

  static TaskDetailCubit of(context) => BlocProvider.of(context);

  late String userName;
  late String userImageUrl;
  late String jobPosition;
  late String taskDescription;
  late String taskTitle;
  late Timestamp upLoadedTaskDateTS;
  late Timestamp deadLineDateTS;
  late String upLoadedDate;
  late String deadLineDate;

  late bool isTaskDone;
  bool isDeadLineDateAvailable = false;

  late String saveComment;
  final formKey = GlobalKey<FormState>();

  late String taskID;
  late String userID;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<DocumentSnapshot<Object?>> getCommentStream() async* {
    var _stream =
        FirebaseFirestore.instance.collection('tasks').doc(taskID).snapshots();

    yield* _stream;
  }

  Future<void> getTaskAndUserDetail(String userId, String taskId) async {
    emit(TaskDetailLoading());

    try {
      final DocumentSnapshot? _userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (_userData == null) {
        return;
      } else {
        userName = _userData.get('userName');
        jobPosition = _userData.get('jobPosition');
        userImageUrl = _userData.get('userImageUrl');
      }

      final DocumentSnapshot? _taskData = await FirebaseFirestore.instance
          .collection('tasks')
          .doc(taskId)
          .get();

      if (_taskData == null) {
        return;
      } else {
        taskID = _taskData.get('taskId');
        userID = _taskData.get('taskUpLoadedBy');
        isTaskDone = _taskData.get('isTaskDone');
        taskDescription = _taskData.get('taskDescription');
        taskTitle = _taskData.get('taskTitle');
        upLoadedTaskDateTS = _taskData.get('taskCreatedDate');
        var _upLoadDate = upLoadedTaskDateTS.toDate();
        upLoadedDate =
            '${_upLoadDate.day}/ ${_upLoadDate.month}/ ${_upLoadDate.year}';

        deadLineDate = _taskData.get('deadLineDate');
        deadLineDateTS = _taskData.get('deadLineDateTimeStamp');

        var _deadLineDate = deadLineDateTS.toDate();
        isDeadLineDateAvailable = _deadLineDate.isAfter(DateTime.now());
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(TaskDetailInit());
  }

  Future<void> updateTaskState(bool value) async {
    emit(TaskDetailLoading());
    final User? _user = _auth.currentUser;
    final _userId = _user!.uid;
    if (_userId == userID) {
      FirebaseFirestore.instance
          .collection('tasks')
          .doc(taskID)
          .update({'isTaskDone': value});
      if (value == true) {
        showSnackBar('task became Done ');
      } else {
        showSnackBar('task became Not Done ');
      }
      MagicRoute.navigateAndReplacement(HomeView());
    } else {
      showSnackBar('not allowed to update task state');
    }

    emit(TaskDetailInit());
  }

  Future<void> addComment() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    emit(TaskDetailLoading());
    try {
      final User? _user = _auth.currentUser;
      final _commenterId = _user!.uid;
      final _autoCommentId = Uuid().v4();
      final _currentUser = await FirebaseFirestore.instance
          .collection('users')
          .doc(_commenterId)
          .get();

      final _commentData = {
        'userID': _commenterId,
        'commentID': _autoCommentId,
        'userName': _currentUser.get('userName'),
        'userImageUrl': _currentUser.get('userImageUrl'),
        'commentBody': saveComment,
        'commentDate': Timestamp.now(),
      };

      await FirebaseFirestore.instance.collection('tasks').doc(taskID).update({
        'taskComment': FieldValue.arrayUnion([_commentData]),
      });
      formKey.currentState!.reset();
    } catch (e) {
      print(e.toString());
      // showSnackBar(e.toString());
    }
    emit(TaskDetailInit());
  }
}
