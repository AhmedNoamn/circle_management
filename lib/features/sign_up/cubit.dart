part of 'view.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInit());

  static SignUpCubit of(context) => BlocProvider.of(context);

  File? imageFile;

  late String userName;
  late String email;
  late String password;
  late String phoneNumber;
  String jobPosition = 'Select a Job Position';
  late String imageUrl;
  final formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void getJobName(String? value) {
    jobPosition = value!;
    emit(SignUpInit());
  }

  Future<void> getCameraImage() async {
    // ignore: deprecated_member_use
    PickedFile? _pickedImage = await ImagePicker().getImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    emit(SignUpLoading());
    try {
      if (_pickedImage != null) {
        File? _imageCrop = await ImageCropper.cropImage(
          sourcePath: _pickedImage.path,
        );

        imageFile = File(
          _imageCrop != null ? _imageCrop.path : _pickedImage.path,
        );
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(SignUpInit());
  }

  Future<void> getGalleryImage() async {
    // ignore: deprecated_member_use
    PickedFile? _pickedImage = await ImagePicker().getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    emit(SignUpLoading());
    try {
      if (_pickedImage != null) {
        File? _cropImage = await ImageCropper.cropImage(
          sourcePath: _pickedImage.path,
        );

        imageFile = File(
          _cropImage != null ? _cropImage.path : _pickedImage.path,
        );
      }
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(SignUpInit());
  }

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return null;
    formKey.currentState!.save();
    emit(SignUpLoading());

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = _auth.currentUser;
      final _uid = user!.uid;

      final _ref = FirebaseStorage.instance
          .ref()
          .child('userImages')
          .child(_uid + '.jpg');

      await _ref.putFile(imageFile!);
      imageUrl = await _ref.getDownloadURL();

      final _userData = {
        'id': _uid,
        'userName': userName,
        'email': email,
        'password': password,
        'userImageUrl': imageUrl,
        'phoneNumber': phoneNumber,
        'jobPosition': jobPosition,
        'userJoinedTime': Timestamp.now(),
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_uid)
          .set(_userData);

      MagicRoute.navigateAndPopAll(HomeView());
    } catch (e) {
      showSnackBar(e.toString());
    }
    emit(SignUpInit());
  }
}
