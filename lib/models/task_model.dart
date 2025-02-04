import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class Task with _$Task {
  factory Task({
    required int id,
    required String title,
    @JsonKey(fromJson: _boolFromJson, toJson: _boolToJson)
    required bool isCompleted,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}

// ✅ Custom functions to handle SQLite integer (0/1) conversion
bool _boolFromJson(dynamic value) => value == 1; // Convert 1 → true, 0 → false
int _boolToJson(bool value) => value ? 1 : 0; // Convert true → 1, false → 0