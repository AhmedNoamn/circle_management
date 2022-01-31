part of '../view.dart';

class _TaskDateData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DateRow(
          titleDate: 'Uploaded Date  :',
          dateText: '22/10/2020',
        ),
        SizedBox(height: 15),
        _DateRow(
          titleDate: 'Expired Date  :',
          dateText: '22/10/2020',
        ),
        Center(
          heightFactor: 1.8,
          child: Text(
            'expired',
            style: style3.copyWith(color: kGreenClr),
          ),
        ),
      ],
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
        Spacer(),
        Text(dateText, style: style4),
      ],
    );
  }
}
