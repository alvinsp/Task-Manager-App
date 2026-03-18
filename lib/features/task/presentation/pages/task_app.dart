import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager_app/features/core/extensions/size_extension.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_bloc.dart';
import 'package:task_manager_app/features/task/presentation/bloc/task_event.dart';
import 'package:task_manager_app/features/task/presentation/widgets/build_task_list.dart';

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  TextEditingController titleController = TextEditingController();

  @override
  void initState() {
    context.read<TaskBloc>().add(LoadTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Task App"),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: SearchBar()),
            20.height,
            Expanded(
              child: buildTaskList(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                insetPadding: const EdgeInsets.all(16),
                title: const Text("Add Task"),
                content: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: "Enter task..."),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<TaskBloc>()
                          .add(AddTask(titleController.text));
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Input Task",
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
