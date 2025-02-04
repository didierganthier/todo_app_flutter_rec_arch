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
}
