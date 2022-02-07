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
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: state is TaskDetailLoading
                    ? Image.asset('assets/images/man.png')
                    : Image.network(
                        cubit.userImageUrl,
                      ),
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
