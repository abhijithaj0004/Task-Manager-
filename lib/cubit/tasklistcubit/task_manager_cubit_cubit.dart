import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskmanager/domain/models/task_model.dart';

part 'task_manager_cubit_state.dart';

class TaskManagerCubit extends Cubit<TaskManagerState> {
  TaskManagerCubit() : super(TaskManagerCubitInitial(taskList: []));
  Future<void> getAllTask() async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    state.taskList.clear();
    state.taskList.addAll(taskDb.values);
    emit(TaskManagerState(taskList: state.taskList));
  }

  Future<void> addNewTask(
    TaskModel taskModel,
  ) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.add(taskModel);
    getAllTask();
  }

  Future<void> deleteTask(int id) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.delete(id);
    getAllTask();
  }

  Future<void> updateTask(int id, TaskModel taskModel) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.put(id, taskModel);
    getAllTask();
  }

  Future<void> setTheState(int id, TaskModel taskModel) async {
    final taskDb = await Hive.openBox<TaskModel>('task_db');
    await taskDb.put(id, taskModel);
    getAllTask();
  }
  
}
