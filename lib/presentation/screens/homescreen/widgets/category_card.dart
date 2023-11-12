import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/core/constants_size.dart';
import 'package:taskmanager/cubit/tasklistcubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/domain/models/task_model.dart';
import 'package:taskmanager/presentation/pages/categoriecheck/categories_list.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/home_model.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/main_container.dart';

class CategoryCards extends StatelessWidget {
  CategoryCards({super.key});
  final homeModel = HomeModel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.35,
      child: BlocBuilder<TaskManagerCubit, TaskManagerState>(
        builder: (context, state) {
          final List<TaskModel> onGoingList = [];
          final List<TaskModel> completedList = [];
          for (var i = 0; i < state.taskList.length; i++) {
            if (state.taskList[i].isCompleted == false) {
              onGoingList.add(state.taskList[i]);
            } else {
              completedList.add(state.taskList[i]);
            }
          }
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: homeModel.categoryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.5),
            itemBuilder: (context, index) {
              return BlocBuilder<TaskManagerCubit, TaskManagerState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      log(index.toString());
                      if (index == 0) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoryListPage(
                            index1: index,
                            taskList: onGoingList,
                          ),
                        ));
                      } else {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategoryListPage(
                            index1: index,
                            taskList: completedList,
                          ),
                        ));
                      }
                    },
                    child: MainContainer(
                      color: homeModel.categoryList[index]['color'],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          homeModel.categoryList[index]['icon'],
                          kHeight20,
                          Text(
                            homeModel.categoryList[index]['name'],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
