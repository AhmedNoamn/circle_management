part of '../view.dart';

class _ButtonUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = AddTaskCubit.of(context);
    return CustomButton(
        onTap: cubit.uploadTask,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'UpLoad',
              style: style2,
            ),
            SizedBox(width: sizeWidth(context, 40)),
            Icon(
              FontAwesomeIcons.upload,
              color: kWhiteClr,
            ),
          ],
        ));
  }
}
