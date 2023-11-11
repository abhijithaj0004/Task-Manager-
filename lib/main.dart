import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanager/cubit/datepickercubit/date_picker_cubit.dart';
import 'package:taskmanager/cubit/tasklistcubit/task_manager_cubit_cubit.dart';
import 'package:taskmanager/cubit/updatelistcubit/update_list_cubit.dart';
import 'package:taskmanager/domain/models/task_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskmanager/firebase_options.dart';
import 'package:taskmanager/presentation/screens/splashscreen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        BlocProvider(
          create: (context) => UpdateListCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat', primarySwatch: Colors.grey),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
