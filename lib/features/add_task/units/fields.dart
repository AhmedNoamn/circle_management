part of '../view.dart';

class _FieldUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = AddTaskCubit.of(context);
    var sizeBx = SizedBox(height: 15);

    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizeBx,
          RichTextField(
            firstText: 'Task Category',
            secondText: '  *',
            style: style3,
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return _showCategoryDialog(context);
            },
          ),
          sizeBx,
          RichTextField(
            firstText: 'Task Title',
            secondText: '  *',
            style: style3,
          ),
          TaskInputField(
            hint: ' ',
            onSaved: (save) => cubit.taskTitle = save!,
            validator: Validator.validName,
          ),
          sizeBx,
          RichTextField(
            firstText: 'Task Description',
            secondText: '  *',
            style: style3,
          ),
          TaskInputField(
            maxLines: 4,
            hint: ' ',
            onSaved: (save) => cubit.taskDescription = save!,
            validator: Validator.validName,
          ),
          sizeBx,
          RichTextField(
            firstText: 'DeadLine Date',
            secondText: '  *',
            style: style3,
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              return TaskInputField(
                onTap: () => _showDateDialog(context),
                controller: cubit.dedLineDate,
                enabled: false,
                trailling: Icon(
                  FontAwesomeIcons.angleDown,
                  color: kBlueClr.withOpacity(0.6),
                  size: 30,
                ),
              );
            },
          ),
          sizeBx,
        ],
      ),
    );
  }
}
