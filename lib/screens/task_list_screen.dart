import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter_rec_arch/viewmodels/task_viewmodel.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewmodel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: ListView.builder(
        itemCount: taskViewModel.tasks.length,
        itemBuilder: (context, index) {
          final task = taskViewModel.tasks[index];
          return ListTile(
            title: Text(task.title),
            leading: Checkbox(
              value: task.isCompleted,
              onChanged: (value) => taskViewModel.toggleTaskCompletion(task),
            ),
            trailing: IconButton(
              onPressed: () => taskViewModel.deleteTask(task.id),
              icon: const Icon(Icons.delete),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => taskViewModel.addTask("New Task"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
