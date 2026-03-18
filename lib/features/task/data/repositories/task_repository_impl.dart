import 'package:task_manager_app/features/task/data/services/task_service.dart';
import 'package:task_manager_app/features/task/domain/entities/task.dart';
import 'package:task_manager_app/features/task/domain/repository/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskService taskService = TaskService();

  TaskRepositoryImpl(TaskService taskService);

  @override
  void add(tasks) {
    taskService.addTasks(
      Task(
        id: tasks.id,
        title: tasks.title,
        isCompleted: false,
        createdAt: DateTime.now(),
      ),
    );
  }

  @override
  void delete(String id) {
    taskService.deleteTask(id);
  }

  @override
  List<Task> get() {
    return taskService.getTasks();
  }

  @override
  List<Task> search(String title) {
    return taskService.searchTask(title);
  }

  @override
  void update(String id, Task task) {
    taskService.updateTask(
      id,
      Task(
          id: task.id,
          title: task.title,
          isCompleted: task.isCompleted,
          createdAt: task.createdAt),
    );
  }

  @override
  void toggleTask(String id, Task task) {
    taskService.toggleTask(
        id,
        Task(
            id: id,
            title: task.title,
            isCompleted: task.isCompleted,
            createdAt: task.createdAt));
  }
}
