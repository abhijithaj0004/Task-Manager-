import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String dueDate;
  @HiveField(3)
  bool isCompleted;
  TaskModel(
      {required this.title,
      required this.description,
      required this.dueDate,
      required this.isCompleted});
}
