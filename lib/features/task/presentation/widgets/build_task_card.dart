import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/features/task/domain/entities/task.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_bloc.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_event.dart';

Card buildTaskCard(Task task, BuildContext context) {
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMMEEEEd('id_ID').format(task.createdAt),
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.read<TaskBloc>().add(ToggleTask(task.id));
          },
          icon: Icon(
            task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            color: task.isCompleted ? Colors.green : Colors.grey,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            context.read<TaskBloc>().add(DeleteTask(task.id));
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    ),
  );
}
