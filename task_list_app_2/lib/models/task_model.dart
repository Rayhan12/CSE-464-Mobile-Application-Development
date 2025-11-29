class TaskModel {
  final int index;
  final String title;
  final String description;
  bool isCompleted;

  TaskModel({
    required this.index,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });


}