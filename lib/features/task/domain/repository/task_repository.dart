import 'package:task_manager_app/features/task/domain/entities/task.dart';

abstract class TaskRepository<T> {
  List<Task> get();
  List<Task> search(String title);
  void add(Task tasks);
  void update(String id, Task task);
  void delete(String id);
  void toggleTask(String id, Task task);
}
