import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'theme/theme_provider.dart';
import 'services/todo_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final todoService = TodoService();
  await todoService.init();
  runApp(MyApp(todoService: todoService));
}

class MyApp extends StatelessWidget {
  final TodoService todoService;

  const MyApp({Key? key, required this.todoService}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Todo App',
            theme: themeProvider.theme,
            home: HomeScreen(todoService: todoService),
          );
        },
      ),
    );
  }
}