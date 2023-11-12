part of 'task_manager_cubit_cubit.dart';

class TaskManagerState {
  List<TaskModel> taskList;
 
  TaskManagerState( {required this.taskList,});
}

class TaskManagerCubitInitial extends TaskManagerState {
  TaskManagerCubitInitial({required super.taskList});
}
