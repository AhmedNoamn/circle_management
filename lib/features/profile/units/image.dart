part of '../view.dart';

class _ImageUUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        final cubit = ProfileCubit.of(context);
        return Positioned(
          height: 80,
          width: 80,
          left: sizeWidth(context, 2.4),
          top: 0,
          child: state is ProfileLoading
              ? CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.transparent,
                  child: Image.asset('assets/images/man.png'),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image.network(cubit.userImageUrl),
                ),
        );
      },
    );
  }
}
