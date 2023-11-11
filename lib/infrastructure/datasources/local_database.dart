import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskmanager/domain/models/task_model.dart';

class DbFunctions {
  List<TaskModel> todoList = [];

  Future<void> addNewTask(TaskModel taskModel) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.add(taskModel);
  }

  Future<void> deleteTask(int id) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.delete(id);
  }

  Future<void> updateTask(int id, TaskModel taskModel) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.put(id, taskModel);
  }
  
}
