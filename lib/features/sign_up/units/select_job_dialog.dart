part of '../view.dart';

_showJobDialog(BuildContext context) {
  final cubit = SignUpCubit.of(context);
  return CustomDropDownMenu(
      itemValue: cubit.jobPosition,
      onChanged: (value) => cubit.getJobName(value),
      generateItems: jobName
          .map<DropdownMenuItem<String>>(
            (String val) => DropdownMenuItem(
              value: val,
              child: Row(
                children: [
                  Text(val),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ),
            ),
          )
          .toList());
}

List<String> jobName = [
  'Select a Position',
  'Manager',
  'Team Leader',
  'Designer',
  'Web Designer',
  'Full Stack Developer',
  'Mobile Developer',
  'Marketing',
  'Digital Marketing',
];
