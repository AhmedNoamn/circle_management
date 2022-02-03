part of '../view.dart';

showDeleteDialog(BuildContext context, String taskId) {
  final cubit = HomeCubit.of(context);
  return showDialog(
    context: context,
    builder: (context) => DeleteDialog(cubit),
  );
}

class DeleteDialog extends StatelessWidget {
  final HomeCubit cubit;

  const DeleteDialog(this.cubit);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.red[900],
                )),
            SizedBox(width: sizeWidth(context, 40)),
            Text(
              'Delete',
              style: style3,
            )
          ],
        )
      ],
    );
  }
}
