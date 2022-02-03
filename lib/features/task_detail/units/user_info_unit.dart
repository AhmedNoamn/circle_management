part of '../view.dart';

class _UserDataUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = TaskDetailCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          children: [
            state is TaskDetailLoading?
                ? CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/man.png'),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      cubit.userImageUrl,
                      height: 50,
                      width: 50,
                    ),
                  ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cubit.userName,
                  style: style3,
                ),
                SizedBox(height: 10),
                Text(
                  '    ' + cubit.jobPosition,
                  style: style3.copyWith(color: kDarkClr.withOpacity(0.5)),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
