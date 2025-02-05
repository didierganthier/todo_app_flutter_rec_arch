import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter_rec_arch/viewmodels/task_viewmodel.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewmodel>(context);

    final TextEditingController newTaskTextEditingController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
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
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 3,
                  maxWidth: MediaQuery.of(context).size.width / 1.5,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: newTaskTextEditingController,
                      onChanged: (value) =>
                          newTaskTextEditingController.text = value,
                      decoration: const InputDecoration(
                        labelText: 'New Task',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (newTaskTextEditingController.text.isEmpty ||
                            newTaskTextEditingController.text.trim() == '') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Row(
                                children: [
                                  Icon(Icons.dangerous),
                                  SizedBox(width: 8.0),
                                  Text('Please enter a task'),
                                ],
                              ),
                            ),
                          );
                        } else {
                          taskViewModel
                              .addTask(newTaskTextEditingController.text);
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Add a new task'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
