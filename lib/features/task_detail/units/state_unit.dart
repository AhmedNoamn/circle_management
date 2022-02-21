part of '../view.dart';

class _StateUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = TaskDetailCubit.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Task State  ',
          style: style3,
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              BlocBuilder(
                bloc: cubit,
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  return _CheckRow(
                    onTap: () {
                      cubit.updateTaskState(true);
                    },
                    stateTitle: 'Done',
                    opacity: cubit.isTaskDone == true ? 1 : 0,
                    color: kGreenClr,
                  );
                },
              ),
              SizedBox(width: 80),
              BlocBuilder(
                bloc: cubit,
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  return _CheckRow(
                    onTap: () {
                      cubit.updateTaskState(false);
                    },
                    stateTitle: 'Not Done',
                    opacity: cubit.isTaskDone == false ? 1 : 0,
                    color: kRedClr,
                  );
                },
              ),
            ],
          ),
        ),
        divider,
        Text(
          'Task Title : ' + cubit.taskTitle,
          style: style3,
        ),
        SizedBox(height: 5),
        Text(
          'Description : ' + cubit.taskDescription,
          style: style4.copyWith(color: kDarkClr.withOpacity(0.7)),
        ),
      ],
    );
  }
}

class _CheckRow extends StatelessWidget {
  const _CheckRow({
    required this.stateTitle,
    required this.opacity,
    required this.color,
    required this.onTap,
  });

  final String stateTitle;
  final double opacity;
  final Color color;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Opacity(
              opacity: opacity,
              child: Icon(
                Icons.check_box,
                color: color,
              )),
          Text(
            ' ' + stateTitle,
            style: style4,
          ),
        ],
      ),
    );
  }
}
