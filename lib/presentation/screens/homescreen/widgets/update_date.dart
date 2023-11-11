import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:taskmanager/cubit/updatelistcubit/update_list_cubit.dart';

class DatePickerUpdate extends StatelessWidget {
  const DatePickerUpdate({
    super.key,
    required this.oldDate,
  });
  final String oldDate;
  @override
  Widget build(BuildContext context) {
    context.read<UpdateListCubit>().state.date = oldDate;
    return BlocBuilder<UpdateListCubit, UpdateListState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showDueDatePicker(context, state.date);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              state.date,
              style: const TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 94, 93, 93)),
            ),
          ),
        );
      },
    );
  }

  showDueDatePicker(BuildContext context, String data) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((value) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(value!);
      context.read<UpdateListCubit>().setaNewDate(formattedDate);
    });
  }
}