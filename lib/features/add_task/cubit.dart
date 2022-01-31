part of 'view.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInit());

  static AddTaskCubit of(context) => BlocProvider.of(context);

  String categoryTask = 'Choose a Category';
  late String taskTitle;
  late String taskDescription;
  late String deadLineDate;
  final formKey = GlobalKey<FormState>();
  late Timestamp deadLineDateTimeStamp;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void getDeadLineDate(String? value) {
    deadLineDate = value!;
    emit(AddTaskInit());
  }

  void getCategoryTask(String? value) {
    categoryTask = value!;
    emit(AddTaskInit());
  }

  Future<void> uploadTask() async {
    if (!formKey.currentState!.validate()) return null;
    formKey.currentState!.save();
    emit(AddTaskLoading());

    try {
      final User? _user = _auth.currentUser;
      final _uId = _user!.uid;

      final _taskData = {
        'taskId': 'taskId',
        'taskUpLoadedBy': _uId,
        'taskTitle': taskTitle,
        'taskDescription': taskDescription,
        'deadLineDate': deadLineDate,
        'deadLineDateTimeStamp': deadLineDateTimeStamp,
        'taskComment': [],
        'isTaskDone': false,
        'taskCreatedDate': Timestamp.now(),
      };

      await FirebaseFirestore.instance
          .collection('tasks')
          .doc(_uId)
          .set(_taskData);
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(AddTaskInit());
  }
}
