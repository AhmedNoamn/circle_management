part of 'view.dart';

class EmployeeCubit extends Cubit<EmployeeStates> {
  EmployeeCubit() : super(EmployeeInit());

  static EmployeeCubit of(context) => BlocProvider.of(context);

  Future<void> sendEmailMessage(String email) async {
    try {
      emit(EmployeeLoading());
      await launch('mailto:$email');
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}
