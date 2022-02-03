part of '../view.dart';

//TODO:

_showFilterDialog(BuildContext context) {
  final cubit = HomeCubit.of(context);
  return showDialog(
    context: context,
    builder: (context) => CustomDialog(
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
