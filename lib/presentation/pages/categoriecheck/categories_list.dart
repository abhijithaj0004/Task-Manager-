import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/core/constant_colors.dart';
import 'package:taskmanager/core/constants_size.dart';
import 'package:taskmanager/cubit/tasklistcubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/domain/models/task_model.dart';

class CategoryListPage extends StatelessWidget {
 const CategoryListPage({super.key, required this.index1, required this.taskList});
  final int index1;
  final List<TaskModel> taskList;
  @override
  Widget build(BuildContext context) {
    log(index1.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: primaryColor,
                        child: Text(
                          '${index + 1}'.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      kWidth20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskList[index].title,
                            style: TextStyle(fontSize: 20),
                          ),
                          kHeight10,
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              taskList[index].description,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(taskList[index].dueDate),
                      IconButton(
                        onPressed: () {
                          context
                              .read<TaskManagerCubit>()
                              .deleteTask(taskList[index].key);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: secondaryColor,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
