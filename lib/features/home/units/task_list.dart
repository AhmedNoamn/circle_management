part of '../view.dart';

class _TaskListUnit extends StatefulWidget {
  @override
  State<_TaskListUnit> createState() => _TaskListUnitState();
}

class _TaskListUnitState extends State<_TaskListUnit> {
  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);
    String taskSearchCategory = '';
    return Column(
      children: [
        _SearchField(
          onChanged: (value) {
            taskSearchCategory = value;
            setState(() {});
            print(taskSearchCategory);
          },
        ),

        //
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: taskSearchCategory != '' || taskSearchCategory.isNotEmpty
                  ? cubit.getSearchDataStream()
                  : cubit.getAlldataStream(),
              builder: (context, snapShot) {
                if (snapShot.connectionState == ConnectionState.waiting) {
                  //
                  return SizedBox(
                    height: 300,
                    child: CircularIndicator(),
                  );
                  //
                } else if (snapShot.connectionState == ConnectionState.active) {
                  //
                  if (snapShot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                        padding: kPadding1(0, 20),
                        itemCount: snapShot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final _taskData = snapShot.data!.docs[index];

                          return _DismisssibleUnit(
                            direction:
                                cubit.currentUse == _taskData['taskUpLoadedBy']
                                    ? DismissDirection.startToEnd
                                    : DismissDirection.none,
                            disKey: Key(_taskData['taskId']),
                            onDismissed: (direction) {
                              cubit.deleteTask(
                                _taskData['taskId'],
                                _taskData['taskUpLoadedBy'],
                              );
                            },
                            child: CustomCard(
                              onTap: () => MagicRoute.navigateTo(
                                TaskDetailView(
                                  taskId: _taskData['taskId'],
                                  taskUpLoadedBy: _taskData['taskUpLoadedBy'],
                                ),
                              ),
                              imageUrl: Image.asset(
                                _taskData['isTaskDone']
                                    ? 'assets/images/true.jpg'
                                    : 'assets/images/stopwatch.png',
                                fit: BoxFit.cover,
                              ),
                              title: _taskData['taskTitle'],
                              description: _taskData['taskDescription'],
                              trailling: Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: kBlueClr.withOpacity(0.8),
                                size: 40,
                              ),
                            ),
                          );
                        });
                  }
                  //
                  else {
                    return ErrorMessage(
                      text: 'there is no data to display ',
                      imageUrl: 'assets/images/warning.png',
                    );
                  }
                }
                //
                return ErrorMessage(
                  text: 'something went wrong',
                  imageUrl: 'assets/images/xxx.png',
                );
              }),
        ),
      ],
    );
  }
}
