part of '../view.dart';

class _InfoCardUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = ProfileCubit.of(context);
    size(double height) => SizedBox(height: height);
    return Card(
      margin: kPadding1(20, 60),
      shape: RoundedRectangleBorder(
        borderRadius: radius25,
      ),
      child: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is ProfileLoading) {
            return SizedBox(
              height: 300,
              child: CircularIndicator(
                color: kBlueClr,
              ),
            );
          } else {
            return Column(
              children: [
                size(70),
                Text(
                  cubit.userName,
                  style: style3,
                ),
                size(15),
                RichTextField(
                  firstText: 'Job : ',
                  secondText: cubit.jobPosition,
                  style: style3,
                ),
                size(10),
                RichTextField(
                  firstText: 'Joined Date : ',
                  secondText: cubit.userJoinedDate,
                  style: style3,
                ),
                divider,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Info : ',
                          style: style3,
                        ),
                        size(15),
                        RichTextField(
                          firstText: 'E-mail : ',
                          secondText: cubit.email,
                          style: style3,
                        ),
                        size(10),
                        RichTextField(
                          firstText: 'Phone Number : ',
                          secondText: cubit.phoneNumber,
                          style: style3,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                _SocialButtonUnit(),
              ],
            );
          }
        },
      ),
    );
  }
}
