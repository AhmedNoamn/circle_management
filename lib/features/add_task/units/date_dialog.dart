part of '../view.dart';

_showDateDialog(BuildContext context) async {
  final cubit = AddTaskCubit.of(context);
  final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2100));

  if (pickedDate != null) {
    cubit.gePickedDate(pickedDate);
  }
}
