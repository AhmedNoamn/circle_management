part of '../view.dart';

_showDateDialog(BuildContext context) async {
  final cubit = AddTaskCubit.of(context);
  final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2100));

  if (picked != null) {
    cubit.deadLineDateTimeStamp =
        Timestamp.fromMicrosecondsSinceEpoch(picked.microsecondsSinceEpoch);

    cubit.getDeadLineDate('${picked.day}/${picked.month}/${picked.year}');
  }
}
