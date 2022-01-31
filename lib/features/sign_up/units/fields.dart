part of '../view.dart';

class _FieldUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.of(context);
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputField(
            hint: 'Full Name',
            validator: Validator.validName,
            onSaved: (save) {
              cubit.userName = save!;
            },
            inputAction: TextInputAction.next,
          ),
          CustomInputField(
            hint: 'E-mail',
            validator: Validator.validEmail,
            onSaved: (save) {
              cubit.email = save!;
            },
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.emailAddress,
          ),
          //
          PasswordField(
            onSaved: (save) {
              cubit.password = save!;
            },
            onValidate: Validator.validPassword,
          ),
          //
          CustomInputField(
            hint: 'Phone Number',
            onSaved: (save) {
              cubit.phoneNumber = save!;
            },
            validator: Validator.validNumber,
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.number,
          ),

          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return _showJobDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
