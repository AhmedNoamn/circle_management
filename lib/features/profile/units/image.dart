part of '../view.dart';

class _ImageUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        final cubit = ProfileCubit.of(context);
        return Positioned(
            height: 90,
            width: 90,
            left: sizeWidth(context, 2.6),
            top: 30,
            child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                  child: state is ProfileLoading
                      ? Image.asset('assets/images/man.png')
                      : Image.network(cubit.userImageUrl),
                )));
      },
    );
  }
}
