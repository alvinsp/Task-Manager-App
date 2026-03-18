sealed class TaskEvent {}

class LoadTasks extends TaskEvent {}

class SearchTasks extends TaskEvent {
  final String title;

  SearchTasks(this.title);
}

class ToggleTask extends TaskEvent {
  final String id;

  ToggleTask(this.id);
}

class AddTask extends TaskEvent {
  final String title;

  AddTask(this.title);
}

class UpdateTask extends TaskEvent {
  final String id;
  final String title;

  UpdateTask(this.id, this.title);
}

class DeleteTask extends TaskEvent {
  final String id;

  DeleteTask(this.id);
}
