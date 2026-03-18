import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_bloc.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_event.dart';

TextField SearchBar(BuildContext context) {
  return TextField(
    decoration: InputDecoration(
      hintText: "Search Task...",
      prefixIcon: const Icon(Icons.search),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onChanged: (value) {
      context.read<TaskBloc>().add(SearchTasks(value));
    },
  );
}
