part of '../view.dart';

class _TaskListUnit extends StatefulWidget {
  @override
  State<_TaskListUnit> createState() => _TaskListUnitState();
}

class _TaskListUnitState extends State<_TaskListUnit> {
  TextEditingController _searchController = TextEditingController();

  late Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = getUsersPastTripsStreamSnapshots();
  }

  _onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (_searchController.text != "") {
      for (var tripSnapshot in _allResults) {
        var title = Task.fromSnapshot(tripSnapshot).taskCategory.toLowerCase();

        if (title.contains(_searchController.text.toLowerCase())) {
          showResults.add(tripSnapshot);
        }
      }
    } else {
      showResults = List.from(_allResults);
    }
    setState(() {
      _resultsList = showResults;
    });
  }

  getUsersPastTripsStreamSnapshots() async {
    var data = await FirebaseFirestore.instance
        .collection('tasks')
        .where('taskCategory')
        .orderBy('taskCreatedDate', descending: true)
        .get();
    setState(() {
      _allResults = data.docs;
    });
    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);

    return Column(
      children: [
        _SearchField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              // cubit.taskSearchCategory = value!;
            });
          },
        ),
        Expanded(
            child: ListView.builder(
                padding: kPadding1(0, 20),
                itemCount: _resultsList.length,
                itemBuilder: (context, index) {
                  final _taskData = Task.fromSnapshot(_resultsList[index]);
                  return _DismisssibleUnit(
                    direction: cubit.currentUse == _taskData.uploadedBy
                        ? DismissDirection.startToEnd
                        : DismissDirection.none,
                    disKey: Key(_taskData.id),
                    onDismissed: (direction) {
                      cubit.deleteTask(
                        _taskData.id,
                        _taskData.uploadedBy,
                      );
                    },
                    child: CustomCard(
                      onTap: () => MagicRoute.navigateTo(
                        TaskDetailView(
                          taskId: _taskData.id,
                          taskUpLoadedBy: _taskData.uploadedBy,
                        ),
                      ),
                      imageUrl: Image.asset(
                        _taskData.isTaskDone
                            ? 'assets/images/true.jpg'
                            : 'assets/images/stopwatch.png',
                        fit: BoxFit.cover,
                      ),
                      title: _taskData.title,
                      description: _taskData.description,
                      trailling: Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: kBlueClr.withOpacity(0.8),
                        size: 40,
                      ),
                    ),
                  );
                })),
      ],
    );
  }
}
/*
 StreamBuilder<QuerySnapshot>(
              // stream: cubit.taskSearchCategory != ''
              //     ? cubit.getSearchedDataStream()
              //     : cubit.getAlldataStream(),
              stream: cubit.getAlldataStream(),
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
*/