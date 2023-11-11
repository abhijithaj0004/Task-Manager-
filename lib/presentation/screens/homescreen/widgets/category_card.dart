import 'package:flutter/material.dart';
import 'package:taskmanager/core/constants_size.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/home_model.dart';
import 'package:taskmanager/presentation/screens/homescreen/widgets/main_container.dart';

class CategoryCards extends StatelessWidget {
  CategoryCards({super.key});
  final homeModel = HomeModel();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.35,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: homeModel.categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.5),
        itemBuilder: (context, index) {
          return MainContainer(
            color: homeModel.categoryList[index]['color'],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                homeModel.categoryList[index]['icon'],
                kHeight20,
                Text(
                  homeModel.categoryList[index]['name'],
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
