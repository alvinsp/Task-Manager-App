import 'package:task_manager_app/core/extensions/uuid.dart';

class Task {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  Task(
      {String? id,
      required this.title,
      required this.isCompleted,
      required this.createdAt})
      : id = id ?? id.orGeneratedId;
}
