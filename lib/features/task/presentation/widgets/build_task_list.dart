import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/task/domain/entities/task.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_bloc.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_state.dart';
import 'package:task_manager_app/features/task/presentation/widgets/build_task_card.dart';

BlocBuilder<TaskBloc, TaskState> buildTaskList() {
  return BlocBuilder<TaskBloc, TaskState>(
    builder: (context, state) {
      if (state is TaskLoaded && state.tasks.isEmpty) {
        return const Center(child: Text("No tasks yet"));
      }
      if (state is TaskLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is TaskLoaded) {
        return Expanded(
          child: ImplicitlyAnimatedList<Task>(
            items: state.tasks,
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            itemBuilder: (context, animation, task, index) {
              return SlideTransition(
                position:
                    Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
                        .animate(animation),
                child: buildTaskCard(task, context),
              );
            },
            removeItemBuilder: (context, animation, oldTask) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0), // Terlempar ke kiri saat dihapus
                  end: Offset.zero,
                ).animate(animation),
                // Kita butuh widget Card yang sama untuk animasi menghilangnya
                child: buildTaskCard(oldTask, context),
              );
            },
          ),
        );
      }
      return const Text("No Task");
    },
  );
}
