part of '../view.dart';

class _TaskDateUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = TaskDetailCubit.of(context);
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _DateRow(
              titleDate: 'Uploaded Date  :',
              dateText: cubit.upLoadedDate,
            ),
            SizedBox(height: 15),
            _DateRow(
              titleDate: 'Expired Date  :',
              dateText: cubit.deadLineDate,
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                cubit.isDeadLineDateAvailable
                    ? 'don\'t worry you have time'
                    : 'sorry this is the end',
                style: style3.copyWith(
                    color: cubit.isDeadLineDateAvailable ? kGreenClr : kRedClr),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DateRow extends StatelessWidget {
  const _DateRow({
    required this.titleDate,
    required this.dateText,
  });
  final String titleDate;
  final String dateText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleDate,
          style: style3,
        ),
        Spacer(
          flex: 2,
        ),
        Text(
          dateText,
          style: style4.copyWith(
            color: titleDate == 'Uploaded Date  :' ? kGreenClr : kRedClr,
          ),
        ),
      ],
    );
  }
}
