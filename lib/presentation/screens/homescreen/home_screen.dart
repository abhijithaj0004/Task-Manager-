import 'package:flutter/material.dart';
import 'package:taskmanager/core/constant_colors.dart';
import 'package:taskmanager/core/constants_size.dart';
import 'package:taskmanager/cubit/tasklistcubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/presentation/screens/addtaskscreen/add_task_screen.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/category_card.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/daily_task_list.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/home_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TaskManagerCubit>().getAllTask();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: HomeAppBar(),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/containerimage.jpg'),
                fit: BoxFit.cover,
                opacity: 235)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight20,
                CategoryCards(),
                kHeight20,
                const Text(
                  'Daily Task',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHeight20,
                const DailyTasks(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddTaskScreen(),
          ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
