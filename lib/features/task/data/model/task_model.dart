import 'package:task_manager_app/features/task/domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel(
      {required super.id,
      required super.title,
      required super.isCompleted,
      required super.createdAt});

  // factory TaskModel.fromJson(Map<String, dynamic> json) {
  //   return TaskModel(
  //       id: json['id'],
  //       title: json['title'],
  //       isCompleted: json['isCompleted'],
  //       createdAt: json['createdAt']);
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "title": title,
  //     "isCompleted": isCompleted,
  //     "createdAt": createdAt,
  //   };
  // }

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "title": title,
      "isCompleted": isCompleted,
      "createdAt": createdAt,
    };
  }

  @override
  String toString() {
    return 'Task(id: $id, title: $title, isCompleted: $isCompleted, createdAt: $createdAt)';
  }
}
