
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskmanager/core/constant_colors.dart';
import 'package:taskmanager/cubit/tasklistcubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/domain/models/task_model.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/edit_task.dart';

class DailyTasks extends StatelessWidget {
  const DailyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagerCubit, TaskManagerState>(
      builder: (context, state) {
        return state.taskList.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.taskList.length,
                itemBuilder: (context, index) {
                  //slidable widget is used for delete the task if the user scroll the tile they can see a delete button
                  return Slidable(
                    endActionPane:
                        ActionPane(motion: const StretchMotion(), children: [
                      SlidableAction(
                        foregroundColor: Colors.white,
                        backgroundColor: secondaryColor,
                        onPressed: (context) {
                          context
                              .read<TaskManagerCubit>()
                              .deleteTask(state.taskList[index].key);
                        },
                        icon: Icons.delete,
                      ),
                      SlidableAction(
                        foregroundColor: Colors.white,
                        backgroundColor: secondaryColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        onPressed: (context) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditTask(
                              oldtitle: state.taskList[index].title,
                              olddes: state.taskList[index].description,
                              id: state.taskList[index].key,
                              oldDate: state.taskList[index].dueDate,
                            ),
                          ));
                        },
                        icon: Icons.edit,
                      )
                    ]),
                    //this container is for listing the required fields
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        //check box
                        leading: ProgressChecker(
                          title: state.taskList[index].title,
                          description: state.taskList[index].description,
                          date: state.taskList[index].dueDate,
                          index: state.taskList[index].key,
                          isCompleted: state.taskList[index].isCompleted,
                        ),
                        title: Text(state.taskList[index].title),
                        subtitle: SizedBox(
                            child: Text(state.taskList[index].description)),
                        trailing: Text(state.taskList[index].dueDate),
                      ),
                    ),
                  );
                },
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: const Center(
                  child: Text(
                    'Add a new Task',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              );
      },
    );
  }
}

//this class is used for checking the task is completed or not
// ignore: must_be_immutable
class ProgressChecker extends StatefulWidget {
  ProgressChecker({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.index,
    required this.isCompleted,
  });
  final String title;
  final String description;
  final String date;
  final int index;
  bool isCompleted;
  @override
  State<ProgressChecker> createState() => _ProgressCheckerState();
}

class _ProgressCheckerState extends State<ProgressChecker> {
  // bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: const BorderSide(
        color: Color.fromARGB(161, 123, 133, 249),
      ),
      activeColor: const Color.fromARGB(161, 123, 133, 249),
      value: widget.isCompleted,
      onChanged: (value) {
        // log(isCompleted.toString());
        setState(() {
          widget.isCompleted = !widget.isCompleted;
        });
        final taskmodel = TaskModel(
            isCompleted: widget.isCompleted,
            description: widget.description,
            title: widget.title,
            dueDate: widget.date);

        context.read<TaskManagerCubit>().setTheState(widget.index, taskmodel);
      },
    );
  }
}
