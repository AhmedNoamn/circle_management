part of '../view.dart';

_showCategoryDialog(BuildContext context) {
  final cubit = AddTaskCubit.of(context);
  return CustomDropDownMenu(
      itemValue: cubit.categoryTask,
      onChanged: (value) => cubit.getCategoryTask(value),
      generateItems: categoryTaskItem
          .map<DropdownMenuItem<String>>(
            (String val) => DropdownMenuItem(
              value: val,
              child: Row(
                children: [
                  Text(val),
                  SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),
          )
          .toList());
}

List<String> categoryTaskItem = [
  'Choose a Category',
  'Business',
  'Programming',
  'Information Technology',
  'Human Resources',
  'Marketing',
  'Design',
  'Accounting',
];
