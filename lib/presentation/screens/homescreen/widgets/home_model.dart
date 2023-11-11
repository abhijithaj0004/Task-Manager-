import 'package:flutter/material.dart';

class HomeModel {
  final List<Map<String, dynamic>> categoryList = [
    {
      'name': 'Ongoing',
      'color': const Color.fromARGB(187, 255, 185, 86),
      'icon': const Icon(
        Icons.timer_outlined,
        color: Colors.white,
        size: 30,
      ),
    },
    {
      'name': 'Completed',
      'color': const Color.fromARGB(161, 123, 133, 249),
      'icon': const Icon(
        Icons.check_box_outlined,
        color: Colors.white,
        size: 30,
      ),
    },
  ];
}
