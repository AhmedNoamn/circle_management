part of '../view.dart';

_showFilterDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => CustomDialog(
      titleDialoge: 'Filter',
      listLength: categoryTaskItem.length,
      listItem: categoryTaskItem,
      actionList: [
        CustomTextButton(
          ontap: () => MagicRoute.pop(),
          child: Text(
            'Close ',
            style: style3,
          ),
        ),
        CustomTextButton(
          ontap: () {},
          child: Text(
            'Cancel Filter ',
            style: style3,
          ),
        ),
      ],
    ),
  );
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
