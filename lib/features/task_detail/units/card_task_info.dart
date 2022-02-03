part of '../view.dart';

class _CardTaskInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = TaskDetailCubit.of(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: radius25),
      margin: kPadding,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return state is TaskDetailLoading
                ? SizedBox(
                    height: 400,
                    child: CircularIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _UserDataUnit(),
                      divider,
                      _TaskDateUnit(),
                      divider,
                      _StateUnit(),
                      SizedBox(height: 15),
                      _AddCommentUnit(),
                      _CommentUnit()
                    ],
                  );
          },
        ),
      ),
    );
  }
}
