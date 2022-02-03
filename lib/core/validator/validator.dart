class Validator {
  static String? validEmail(String? value) {
    if (value!.isEmpty)
      return 'The E-mail should\'nt empty';
    else if (value.contains(' '))
      return 'The E-mail should\'nt contain spacing';
    else if (!value.contains('@')) return 'Ex: aaaa@aaa.com';
  }

  static String? validName(String? value) {
    if (value!.isEmpty)
      return 'the name shouldn\'t be empty';
    else if (value.length < 3) return 'name should be at least 3 character';
  }

  static String? validPassword(String? value) {
    if (value!.isEmpty)
      return 'Password is empty';
    else if (value.contains(' '))
      return 'password should\'nt contain spacing';
    else if (!value.contains(
      RegExp(
        r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{7,}$',
      ),
    )) return 'password must contain \n upper and lower character';
  }

  static String? validNumber(String? value) {
    if (value!.isEmpty) {
      return 'number is empty';
    } else if (!value.contains(
      RegExp(
        r'^(?=.*\d).{7,}$',
      ),
    )) {
      return 'phone number should be numeric';
    }
  }
}
