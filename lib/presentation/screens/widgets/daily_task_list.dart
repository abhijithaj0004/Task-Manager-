import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:taskmanager/core/constant_colors.dart';

class DailyTasks extends StatelessWidget {
  const DailyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              foregroundColor: Colors.white,
              backgroundColor: secondaryColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              onPressed: (context) {},
              icon: Icons.delete,
            )
          ]),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Checkbox(
                side: const BorderSide(
                  color: Color.fromARGB(161, 123, 133, 249),
                ),
                activeColor: const Color.fromARGB(161, 123, 133, 249),
                value: true,
                onChanged: (value) {},
              ),
              title: Text('data'),
              subtitle: Text('des'),
              trailing: Text('12/23/2022'),
            ),
          ),
        );
      },
    );
  }
}
