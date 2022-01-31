part of 'view.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInit());

  static SignInCubit of(context) => BlocProvider.of(context);

  late String email;
  late String password;
  final formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sigIn() async {
    if (!formKey.currentState!.validate()) return null;
    formKey.currentState!.save();
    emit(SignInLoading());

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? _user = _auth.currentUser;
      final uid = _user!.uid;

      print(uid);
      MagicRoute.navigateAndPopAll(HomeView());
    } catch (e) {
      showSnackBar(e.toString());
    }

    emit(SignInInit());
  }
}
