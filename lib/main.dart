import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_flutter_rec_arch/repositories/task_repository.dart';
import 'package:todo_app_flutter_rec_arch/routes.dart';
import 'package:todo_app_flutter_rec_arch/viewmodels/task_viewmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => TaskRepository()),
        ChangeNotifierProvider(
          create: (context) => TaskViewmodel(context.read<TaskRepository>()),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
