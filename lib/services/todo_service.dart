import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo.dart';

class TodoService {
  static const String _boxName = 'todos';

  Future<Box<Todo>> get _box async =>
      await Hive.openBox<Todo>(_boxName);

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());
    await Hive.openBox<Todo>(_boxName);
  }

  Future<void> addTodo(Todo todo) async {
    final box = await _box;
    await box.add(todo);
  }

  Future<List<Todo>> getTodos() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> updateTodo(Todo todo) async {
    await todo.save();
  }

  Future<void> deleteTodo(Todo todo) async {
    await todo.delete();
  }
}