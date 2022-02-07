part of '../view.dart';

class _DismisssibleUnit extends StatelessWidget {
  const _DismisssibleUnit({
    required this.disKey,
    required this.onDismissed,
    required this.child,
    required this.direction,
  });
  final Key disKey;
  final Function(DismissDirection)? onDismissed;
  final Widget child;
  final DismissDirection direction;

  @override
  Widget build(BuildContext context) {
    // final cubit = HomeCubit.of(context);

    return Dismissible(
      direction: direction,
      onDismissed: onDismissed,
      key: disKey,
      background: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            'Delete ',
            style: style2.copyWith(color: kDarkClr),
          ),
          Icon(
            Icons.delete,
            color: kRedClr,
          ),
        ],
      ),
      child: child,
    );
  }
}
