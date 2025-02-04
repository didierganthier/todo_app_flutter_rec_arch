import 'package:go_router/go_router.dart';
import 'package:todo_app_flutter_rec_arch/screens/task_list_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const TaskListScreen(),
  )
]);
