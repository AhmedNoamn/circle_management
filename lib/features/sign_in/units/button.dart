part of '../view.dart';

class _ButtonsUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = SignInCubit.of(context);
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: CustomTextButton(
              onTap: () => MagicRoute.navigateTo(
                    ForgetPasswordView(),
                  ),
              child: Text(
                'Forgot Password? ',
                style: style3,
              )),
        ),
        SizedBox(
          height: sizeHeight(context, 10),
        ),
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return state is SignInLoading
                ? CircularIndicator()
                : CustomButton(
                    onTap: cubit.sigIn,
                    child: Text(
                      'Sign In',
                      style: style2,
                    ));
          },
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'didn\'t sign up yet ? ',
            style: style4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomTextButton(
              onTap: () => MagicRoute.navigateAndReplacement(SignUpView()),
              child: Text(
                'Sign up',
                style: style3.copyWith(color: kGreenClr),
              ))
        ])
      ],
    );
  }
}
