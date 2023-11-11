import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/cubit/datepickercubit/date_picker_cubit.dart';
import 'package:taskmanager/cubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/domain/models/task_model.dart';
import 'package:taskmanager/presentation/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(TaskModelAdapter().typeId)) {
    Hive.registerAdapter(TaskModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskManagerCubit(),
        ),
        BlocProvider(
          create: (context) => DatePickerCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
