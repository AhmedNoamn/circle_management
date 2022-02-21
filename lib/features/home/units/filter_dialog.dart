part of '../view.dart';

_showCategoryDialog() {
  return showDialog(
    context: MagicRoute.currentContext,
    builder: (context) => _CategoryDialog(),
  );
}

class _CategoryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: kPadding3,
      title: Container(
        padding: kPadding1(15, 10),
        color: kBlueClr,
        child: Text(
          'Type of Task',
          style: style2,
        ),
      ),
      content: SizedBox(
        width: sizeWidth(context, 1),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryTaskItem.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.checkSquare),
                Text(
                  categoryTaskItem[index],
                  style: style3,
                )
              ],
            ),
          ),
        ),
      ),
      actions: [
        CustomTextButton(
          onTap: () {
            MagicRoute.pop();
          },
          child: Text(
            'Close ',
            style: style3,
          ),
        ),
      ],
    );
  }
}

List<String> categoryTaskItem = [
  'Business',
  'Programming',
  'Information Technology',
  'Human Resources',
  'Marketing',
  'Design',
  'Accounting',
];
