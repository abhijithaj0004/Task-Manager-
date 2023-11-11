import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/core/constant_colors.dart';
import 'package:taskmanager/core/constants_size.dart';
import 'package:taskmanager/cubit/datepickercubit/date_picker_cubit.dart';
import 'package:taskmanager/cubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/domain/models/task_model.dart';
import 'package:taskmanager/infrastructure/datasources/local_database.dart';
import 'package:taskmanager/presentation/screens/addtaskscreen/widgets/date_picker.dart';
import 'package:taskmanager/presentation/screens/addtaskscreen/widgets/task_adding_fields.dart';
import 'package:taskmanager/presentation/screens/widgets/main_container.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final dbFns = DbFunctions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/containerimage.jpg'),
                  fit: BoxFit.cover,
                  opacity: 230)),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskAddingFields(
                  titleController: titleController,
                  hintTxt: 'Title',
                  errorTxt: 'Title is required',
                ),
                kHeight20,
                TaskAddingFields(
                  titleController: descriptionController,
                  hintTxt: 'Description',
                  errorTxt: 'Description is required',
                ),
                kHeight20,
                const DatePicker(),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      final String title = titleController.text.trim();
                      final String description =
                          descriptionController.text.trim();
                      String date =
                          context.read<DatePickerCubit>().state.dateData;
                      if (date != 'Due Date') {
                        final taskModel = TaskModel(
                            title: title,
                            description: description,
                            dueDate: date);
                        context.read<TaskManagerCubit>().addNewTask(taskModel);
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Add a Date')));
                      }
                    }
                  },
                  child: const MainContainer(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    color: primaryColor,
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
