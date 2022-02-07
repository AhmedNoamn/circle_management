part of '../view.dart';

//TODO:
_showFilterDialog(BuildContext context) {
  final cubit = HomeCubit.of(context);
  return showDialog(
    context: context,
    builder: (context) => _FilterDialog(cubit),
  );
}

class _FilterDialog extends StatelessWidget {
  const _FilterDialog(this.cubit);
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: kPadding3,
      title: Container(
        padding: kPadding,
        color: kBlueClr,
        child: Text(
          'Filter',
          style: style2,
        ),
      ),
      content: SizedBox(
        width: sizeWidth(context, 1),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryTaskItem.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              cubit.FilterResult(categoryTaskItem[index]);
              MagicRoute.pop(context);
            },
            child: Padding(
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
        CustomTextButton(
          onTap: () {
            cubit.FilterResult(null);
            MagicRoute.pop(context);
          },
          child: Text(
            'Cancel Filter ',
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

/*
CustomDialog(
      titleDialoge: 'Filter',
      listLength: categoryTaskItem.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          cubit.FilterResult(categoryTaskItem[index]);
          MagicRoute.pop(context);
        },
        child: Padding(
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
      actionList: [
        CustomTextButton(
          onTap: () {
            MagicRoute.pop();
          },
          child: Text(
            'Close ',
            style: style3,
          ),
        ),
        CustomTextButton(
          onTap: () {
            cubit.FilterResult(null);
            MagicRoute.pop(context);
          },
          child: Text(
            'Cancel Filter ',
            style: style3,
          ),
        ),
      ],
    ),
*/