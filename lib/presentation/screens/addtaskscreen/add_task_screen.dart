import 'package:flutter/material.dart';
import 'package:taskmanager/core/constant_colors.dart';
import 'package:taskmanager/core/constants_size.dart';
import 'package:taskmanager/presentation/screens/addtaskscreen/widgets/task_adding_fields.dart';
import 'package:taskmanager/presentation/screens/widgets/main_container.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: Column(
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
              TaskAddingFields(
                titleController: dateController,
                hintTxt: 'Due Date',
                errorTxt: 'Due Date is required',
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).pop();
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
    );
  }
}


