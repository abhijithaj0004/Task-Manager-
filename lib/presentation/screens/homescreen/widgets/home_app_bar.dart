import 'package:firebase_auth/firebase_auth.dart';
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
            child: FirebaseAuth.instance.currentUser!.photoURL == null
                ? Image.asset(
                    'assets/images/Modified-Bitmoji.png',
                    height: 50,
                  )
                : Image.network(
                    FirebaseAuth.instance.currentUser!.photoURL ?? '')),
      ),
      centerTitle: true,
      title: const Text(
        'Task Manager',
        style: TextStyle(color: Colors.black, fontSize: 23),
      ),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do you want to Logout?'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pop(context);
                        },
                        child: const Text('Logout')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'))
                  ],
                ),
              );
            },
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 109, 108, 108),
            ))
      ],
    );
  }
}
