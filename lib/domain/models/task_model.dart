import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String dueDate;

  TaskModel({required this.title, required this.description, required this.dueDate});
}
