import 'package:flutter/material.dart';
import 'package:taskmanager/core/constant_colors.dart';
import 'package:taskmanager/core/constants_size.dart';
import 'package:taskmanager/domain/models/task_model.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key, required this.taskList});

  final List<TaskModel> taskList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: taskList.isNotEmpty
              ? ListView.builder(
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
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                  kHeight10,
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    child: Text(
                                      taskList[index].description,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(taskList[index].dueDate),
                        ],
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'No Task Found',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
    );
  }
}
