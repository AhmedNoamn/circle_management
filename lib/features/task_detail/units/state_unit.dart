part of '../view.dart';

class _StateUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            children: const [
              _CheckRow(
                stateTitle: 'Done',
                opacity: 1,
                color: kGreenClr,
              ),
              SizedBox(width: 80),
              _CheckRow(
                stateTitle: 'Not Done',
                opacity: 1,
                color: kRedClr,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Divider(
            height: 25,
            thickness: 2,
            color: kGreyClr,
          ),
        ),
        Text(
          'Task Description',
          style: style3,
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'description',
            style: style4.copyWith(color: kDarkClr.withOpacity(0.7)),
          ),
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
  });

  final String stateTitle;
  final double opacity;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          stateTitle,
          style: style4,
        ),
        Opacity(
            opacity: opacity,
            child: Icon(
              Icons.check_box,
              color: color,
            )),
      ],
    );
  }
}
