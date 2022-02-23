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
  bool isLoading = true;

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
    resultsLoaded = getTasksStream();
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

  getTasksStream() async {
    try {
      var data = await FirebaseFirestore.instance
          .collection('tasks')
          .where('taskCategory')
          .orderBy('taskCreatedDate', descending: true)
          .get();
      setState(() {
        _allResults = data.docs;
      });
      isLoading = false;
      searchResultsList();
    } catch (e) {
      setState(() {
        _allResults = [];
      });
      isLoading = true;
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = HomeCubit.of(context);

    if (isLoading == false) {
      return Column(
        children: [
          _SearchField(
            controller: _searchController,
          ),
          Expanded(
              child: _resultsList.isEmpty
                  ? ErrorMessage(
                      text: 'there are no tasks yet...\n add first task ',
                      imageUrl: 'assets/images/xxx.png',
                    )
                  : ListView.builder(
                      padding: kPadding1(0, 20),
                      itemCount: _resultsList.length,
                      itemBuilder: (context, index) {
                        final _taskData =
                            Task.fromSnapshot(_resultsList[index]);
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

    return Center(
      heightFactor: 6,
      child: CircularIndicator(),
    );
  }
}
