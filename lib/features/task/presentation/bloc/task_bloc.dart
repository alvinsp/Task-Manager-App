import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/task/data/model/task_model.dart';
import 'package:task_manager_app/features/task/data/repositories/task_repository_impl.dart';
import 'package:task_manager_app/features/task/domain/entities/task.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_event.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_state.dart';
import 'package:uuid/uuid.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepositoryImpl repository;

  TaskBloc(this.repository) : super(TaskInitial()) {
    on<LoadTasks>(_loadTasks);
    on<SearchTasks>(_searchTasks);
    on<AddTask>(_addTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
    on<ToggleTask>(_onToggleTask);
  }

  void _loadTasks(LoadTasks event, Emitter<TaskState> emit) {
    try {
      emit(TaskLoading());
      final tasks = repository.get();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError("Failed to Load"));
    }
  }

  void _searchTasks(SearchTasks event, Emitter<TaskState> emit) {
    try {
      emit(TaskLoading());
      final tasks = repository.search(event.title);
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError("Failed to Search"));
    }
  }

  void _onToggleTask(ToggleTask event, Emitter<TaskState> emit) {
    try {
      if (state is TaskLoaded) {
        final currentState = state as TaskLoaded;

        final oldTask = currentState.tasks.firstWhere((t) => t.id == event.id);

        final updateTask = Task(
            id: oldTask.id,
            title: oldTask.title,
            isCompleted: !oldTask.isCompleted,
            createdAt: oldTask.createdAt);
        repository.toggleTask(event.id, updateTask);

        print(updateTask.isCompleted);

        final tasks = repository.get();
        emit(TaskLoaded(tasks));
      }
    } catch (e) {
      emit(TaskError("Failed to Change Toggle"));
    }
  }

  void _addTask(AddTask event, Emitter<TaskState> emit) {
    try {
      repository.add(TaskModel(
          id: const Uuid().v4(),
          title: event.title,
          isCompleted: false,
          createdAt: DateTime.now()));
      emit(TaskLoading());
      final tasks = repository.get();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError("Failed to Add"));
    }
  }

  void _updateTask(UpdateTask event, Emitter<TaskState> emit) {
    try {
      if (state is TaskLoaded) {
        final currentState = state as TaskLoaded;
        final oldTask =
            currentState.tasks.firstWhere((task) => task.id == event.id);
        repository.update(
          event.id,
          TaskModel(
              id: oldTask.id,
              title: event.title,
              isCompleted: oldTask.isCompleted,
              createdAt: oldTask.createdAt),
        );

        final tasks = repository.get();

        emit(TaskLoaded(tasks));
      }
    } catch (e) {
      emit(TaskError("Failed to Add"));
    }
  }

  void _deleteTask(DeleteTask event, Emitter<TaskState> emit) {
    try {
      repository.delete(event.id);
      final tasks = repository.get();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(TaskError("Failed to Add"));
    }
  }
}
