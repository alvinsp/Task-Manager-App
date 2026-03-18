import 'package:task_manager_app/features/task/domain/entities/task.dart';

class TaskService {
  List<Task> tasks = [];

  List<Task> getTasks() {
    return tasks;
  }

  void addTasks(Task task) {
    tasks.add(task);
  }

  List<Task> searchTask(String title) {
    return tasks
        .where((task) => task.title.toLowerCase() == title.toLowerCase())
        .toList();
  }

  void updateTask(String id, Task task) {
    int index = tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  void toggleTask(String id, Task updatedTask) {
    final index = tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      tasks[index] = updatedTask;
      print(
          'Task di service berhasil ditimpa! Status baru: ${updatedTask.isCompleted}');
    } else {
      print('Error: Task dengan ID $id tidak ditemukan di service!');
    }
  }

  void deleteTask(String id) {
    tasks.removeWhere((task) => task.id == id);
  }
}
