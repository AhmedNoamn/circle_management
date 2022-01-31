part of '../view.dart';

class _FieldUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SignInCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputField(
            hint: 'E-mail',
            onSaved: (save) {
              cubit.email = save!;
            },
            inputAction: TextInputAction.next,
          ),
          //
          PasswordField(
            onSaved: (save) {
              cubit.password = save!;
            },
          ),
          //
        ],
      ),
    );
  }
}
