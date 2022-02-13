part of 'view.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInit());

  static AddTaskCubit of(context) => BlocProvider.of(context);

  String taskCategory = 'Choose a Category';
  late String taskTitle;
  late String taskDescription;
  TextEditingController dedLineDate =
      TextEditingController(text: 'pick a date');
  final formKey = GlobalKey<FormState>();
  late Timestamp deadLineDateTimeStamp;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void gePickedDate(DateTime? value) {
    deadLineDateTimeStamp =
        Timestamp.fromMicrosecondsSinceEpoch(value!.microsecondsSinceEpoch);

    dedLineDate.text = '${value.day}/ ${value.month}/ ${value.year}';

    emit(AddTaskInit());
  }

  void getCategoryTask(String? value) {
    taskCategory = value!;
    emit(AddTaskInit());
  }

  Future<void> uploadTask() async {
    if (!formKey.currentState!.validate()) return null;
    formKey.currentState!.save();
    emit(AddTaskLoading());

    try {
      final User? _user = _auth.currentUser;
      final _uId = _user!.uid;
      final taskId = Uuid().v4();

      final _taskData = {
        'taskId': taskId,
        'taskUpLoadedBy': _uId,
        'taskCategory': taskCategory,
        'taskTitle': taskTitle,
        'taskDescription': taskDescription,
        'deadLineDate': dedLineDate.text,
        'deadLineDateTimeStamp': deadLineDateTimeStamp,
        'taskComment': [],
        'isTaskDone': false,
        'taskCreatedDate': Timestamp.now(),
      };

      await FirebaseFirestore.instance
          .collection('tasks')
          .doc(taskId)
          .set(_taskData);
      showSnackBar('Task Uploaded Successfully');
      MagicRoute.navigateAndPopAll(HomeView());

      formKey.currentState!.reset();
      dedLineDate.clear();
      taskCategory = 'Choose a Category';
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(AddTaskInit());
  }
}
