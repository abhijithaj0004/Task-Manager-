import 'package:flutter/material.dart';
import 'package:taskmanager/core/constant_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: CircleAvatar(
          backgroundColor: primaryColor,
          child: Image.asset(
            'assets/images/Modified-Bitmoji.png',
            height: 50,
          ),
        ),
      ),
      title: const Text(
        'Task Manager',
        style: TextStyle(color: Colors.black, fontSize: 23),
      ),
    );
  }
}
