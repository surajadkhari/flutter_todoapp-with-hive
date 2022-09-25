class TaskModel {
  final String taskName;
  bool isTaskCompleted;
  TaskModel({required this.taskName, this.isTaskCompleted = false});
}

List<TaskModel> toDoList = [
  TaskModel(
    taskName: "Hlelo",
  ),
  TaskModel(
    taskName: "Yogo",
  ),
  TaskModel(taskName: "learn new Flutter Widget", isTaskCompleted: true)
];
