import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/core/constant_colors.dart';
import 'package:taskmanager/core/constants_size.dart';
import 'package:taskmanager/cubit/tasklistcubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/cubit/updatelistcubit/update_list_cubit.dart';
import 'package:taskmanager/domain/models/task_model.dart';
import 'package:taskmanager/presentation/screens/addtaskscreen/widgets/task_adding_fields.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/main_container.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/update_date.dart';

class EditTask extends StatelessWidget {
  EditTask(
      {super.key,
      required this.oldtitle,
      required this.olddes,
      required this.id,
      required this.oldDate});
  final newTitleController = TextEditingController();
  final newDesController = TextEditingController();
  final String oldtitle;
  final String olddes;
  final String oldDate;
  final formKey = GlobalKey<FormState>();
  final int id;
  @override
  Widget build(BuildContext context) {
    newTitleController.text = oldtitle;
    newDesController.text = olddes;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/containerimage.jpg'),
                fit: BoxFit.cover,
                opacity: 230)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kHeight20,
                  TaskFields(
                      titleController: newTitleController,
                      errorTxt: 'Title required',
                      hintTxt: 'Title'),
                  kHeight20,
                  TaskFields(
                      titleController: newDesController,
                      errorTxt: 'Description required',
                      hintTxt: 'Description'),
                  kHeight20,
                  DatePickerUpdate(
                    oldDate: oldDate,
                  ),
                  kHeight30,
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final String newTitle = newTitleController.text.trim();
                        final String newDes = newDesController.text.trim();
                        String newdate =
                            context.read<UpdateListCubit>().state.date;
                        final taskModel = TaskModel(
                            title: newTitle,
                            description: newDes,
                            dueDate: newdate);
                        context
                            .read<TaskManagerCubit>()
                            .updateTask(id, taskModel);
                      }
                      Navigator.of(context).pop();
                    },
                    child: MainContainer(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.all(20),
                      color: primaryColor,
                      child: Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
