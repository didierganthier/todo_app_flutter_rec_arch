import 'package:flutter/material.dart';
import 'package:todo_app_flutter_rec_arch/models/task_model.dart';
import 'package:todo_app_flutter_rec_arch/repositories/task_repository.dart';

class TaskViewmodel extends ChangeNotifier {
  final TaskRepository _taskRepository;

  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  TaskViewmodel(this._taskRepository) {
    fetchTasks();
  }

  Future<void> fetchTasks() async {
    _tasks = await _taskRepository.getTasks();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    final newTask = Task(
        id: DateTime.now().microsecondsSinceEpoch,
        title: title,
        isCompleted: false);
    await _taskRepository.addTask(newTask);
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(Task task) async {
    final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
    await _taskRepository.updateTask(task);
    fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _taskRepository.deleteTask(id);
    fetchTasks();
  }
}
