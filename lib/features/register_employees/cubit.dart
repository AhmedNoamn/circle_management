part of 'view.dart';

class EmployeeCubit extends Cubit<EmployeeStates> {
  EmployeeCubit() : super(EmployeeInit());

  static EmployeeCubit of(context) => BlocProvider.of(context);

  Stream<QuerySnapshot<Object?>> getAllEmployeeStream() async* {
    var _stream = FirebaseFirestore.instance.collection('users').snapshots();

    yield* _stream;
  }

  Future<void> sendEmailMessage(String email) async {
    try {
      emit(EmployeeLoading());
      await launch('mailto:$email');
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}
