part of '../view.dart';

class _ButtonUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = AddTaskCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return state is AddTaskLoading
            ? CircularIndicator(
                color: kBlueClr,
              )
            : CustomButton(
                onTap: cubit.uploadTask,
                child: Text(
                  'UpLoad',
                  style: style2,
                ));
      },
    );
  }
}
