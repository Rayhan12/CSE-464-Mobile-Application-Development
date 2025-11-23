class Task {
  final int id;
  final String title;
  final String description;
  bool isCompleted = false;
  
  Task({
    required this.id,
    required this.title,
    required this.description,
  });
}