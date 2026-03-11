import 'package:task_manager_app/features/task/data/model/task_model.dart';
import 'package:uuid/uuid.dart';

class TaskService {
  final Uuid uuid = const Uuid();

  List<TaskModel> tasks = [];

  List<TaskModel> getTasks() {
    return tasks;
  }

  void addTasks(TaskModel task) {
    tasks.add(task);
  }

  List<TaskModel> searchTasks(String title) {
    return tasks
        .where((t) => t.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }

  void updateTask(String id, TaskModel task) {
    int index = tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  void deleteTask(String id) {
    tasks.removeWhere((t) => t.id.toLowerCase() == id.toLowerCase());
  }
}
