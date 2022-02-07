part of '../view.dart';

class _SocialButtonUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _authInit = FirebaseAuth.instance;

    final cubit = ProfileCubit.of(context);
    return Column(
      children: [
        cubit.isCurrentUser
            ? SizedBox(
                height: 0,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleButton(
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: kGreenClr,
                      ),
                      onTap: () {
                        cubit.sendMessageOrCallEmployee(
                          'https://wa.me/+2' +
                              cubit.phoneNumber +
                              '?text= how can i help you ?',
                        );
                      }),
                  CircleButton(
                    icon: Icon(
                      FontAwesomeIcons.envelope,
                      color: kGreenClr,
                    ),
                    onTap: () {
                      cubit.sendMessageOrCallEmployee(
                        'mailto:${cubit.email}',
                      );
                    },
                  ),
                  CircleButton(
                    icon: Icon(
                      FontAwesomeIcons.phone,
                      color: kGreenClr,
                    ),
                    onTap: () {
                      cubit.sendMessageOrCallEmployee(
                        'tel:+2' + cubit.phoneNumber,
                      );
                    },
                  ),
                ],
              ),
        cubit.isCurrentUser
            ? Column(
                children: [
                  divider,
                  CustomButton(
                    onTap: () async {
                      await _authInit.signOut();
                      MagicRoute.navigateAndReplacement(SignInView());
                    },
                    child: Text(
                      'LOG OUT',
                      style: style2.copyWith(fontSize: 16),
                    ),
                    height: 50,
                    width: sizeWidth(context, 2.5),
                  )
                ],
              )
            : SizedBox(
                height: 30,
              ),
      ],
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    required this.icon,
    required this.onTap,
  });
  final Widget icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: kGreyClr.withOpacity(0.6),
      child: IconButton(
        onPressed: onTap,
        icon: icon,
      ),
    );
  }
}
