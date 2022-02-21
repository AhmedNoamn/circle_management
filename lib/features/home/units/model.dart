import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  late String id;
  late String title;
  late String description;
  late String uploadedBy;
  late String taskCategory;
  late bool isTaskDone;
  Task(
    this.id,
    this.title,
    this.description,
    this.uploadedBy,
    this.taskCategory,
    this.isTaskDone,
  );

  Task.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot['taskId'],
        title = snapshot['taskTitle'],
        description = snapshot['taskDescription'],
        uploadedBy = snapshot['taskUpLoadedBy'],
        taskCategory = snapshot['taskCategory'],
        isTaskDone = snapshot['isTaskDone'];
}
