part of '../view.dart';

class ButtonsUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return state is SignUpLoading
                  ? CircularIndicator()
                  : CustomButton(
                      onTap: cubit.signUp,
                      child: Text(
                        'Sign Up',
                        style: style2,
                      ));
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'already have an Account ? ',
              style: style4.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomTextButton(
              onTap: () => MagicRoute.navigateAndPopAll(SignInView()),
              child: Text(
                'Sign in',
                style: style3.copyWith(color: kGreenClr),
              ),
            ),
          ],
        )
      ],
    );
  }
}
