part of '../view.dart';

KShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => DeleteDialog(),
  );
}

class DeleteDialog extends StatelessWidget {
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
