import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/cubit/datepickercubit/date_picker_cubit.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatePickerCubit, DatePickerState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            showDueDatePicker(context, state.dateData);
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: Text(
              state.dateData,
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
      context.read<DatePickerCubit>().showDate(formattedDate.toString());
    });
  }
}
