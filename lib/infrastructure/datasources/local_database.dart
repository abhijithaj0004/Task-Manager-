import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskmanager/cubit/tasklistcubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/domain/models/task_model.dart';

class DbFunctions {
  List<TaskModel> todoList = [];
  final taskManagerCubitCubit = TaskManagerCubit();
  Future<void> addNewTask(
    TaskModel taskModel,
  ) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.add(taskModel);
    taskManagerCubitCubit.getAllTask();
  }

  Future<void> deleteTask(int id) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.delete(id);
    taskManagerCubitCubit.getAllTask();
  }

  Future<void> updateTask(int id, TaskModel taskModel) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.put(id, taskModel);
    taskManagerCubitCubit.getAllTask();
  }

  // Future<void> getAllTask() async {
  //   final taskDb = await Hive.openBox<TaskModel>('task_db');
  //   todoList.clear();
  //   todoList.addAll(taskDb.values);
  // }
}
