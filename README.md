# Flutter Todo List App

A feature-rich Todo List application built with Flutter, demonstrating two different local storage implementations: SQLite and Hive. This project showcases best practices in Flutter development, state management, and local data persistence.

## Features

The application includes the following features:
- Create, read, update, and delete tasks
- Mark tasks as complete/incomplete
- Dark mode support
- Calendar integration for task scheduling
- Two storage implementations (SQLite and Hive)
- Date filtering for tasks

## Project Structure

```
lib/
├── models/
│   └── todo.dart
├── screens/
│   └── home_screen.dart
├── services/
│   ├── database_helper.dart (SQLite version)
│   └── todo_service.dart (Hive version)
├── theme/
│   └── theme_provider.dart
└── main.dart
```

## Storage Implementations

### SQLite Version

The SQLite implementation uses the `sqflite` package for local storage. It provides:
- Structured SQL database with proper schema
- ACID compliance
- Robust data querying capabilities

Dependencies required:
```yaml
dependencies:
  sqflite: ^2.3.2
  path: ^1.8.3
```

Key files:
- `database_helper.dart`: Manages database operations
- `models/todo.dart`: Data model with SQLite mapping

To initialize the SQLite database:
```dart
final dbHelper = DatabaseHelper();
// Database is initialized automatically on first use
```

### Hive Version

The Hive implementation uses Hive for local storage, offering:
- Fast NoSQL database
- Type-safe data storage
- Lower overhead compared to SQLite

Dependencies required:
```yaml
dependencies:
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
dev_dependencies:
  build_runner: ^2.4.6
  hive_generator: ^2.0.1
```

Key files:
- `todo_service.dart`: Manages Hive operations
- `models/todo.dart`: Data model with Hive annotations

To initialize Hive:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final todoService = TodoService();
  await todoService.init();
  runApp(MyApp(todoService: todoService));
}
```

Generate Hive adapters:
```bash
flutter pub run build_runner build
```

## Common Dependencies

Both versions require these dependencies:
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  table_calendar: ^3.0.9
  intl: ^0.18.1
```

## Setup Instructions

1. Clone the repository
2. Choose your preferred storage implementation:
    - For SQLite: Check out the `sqlite` branch
    - For Hive: Check out the `hive` branch
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. If using Hive, generate the adapter:
   ```bash
   flutter pub run build_runner build
   ```
5. Run the app:
   ```bash
   flutter run
   ```

## Storage Implementation Comparison

### SQLite Advantages
- Robust relational database with ACID compliance
- Complex queries and data relationships
- Well-established and widely used
- Better for complex data structures and relationships

### Hive Advantages
- Faster performance for simple operations
- Simpler implementation with less boilerplate
- Type-safe data storage
- Lower resource usage
- Better for simple data structures

### When to Choose Which

Choose SQLite when:
- You need complex queries
- Your data has many relationships
- ACID compliance is important
- You're building a larger application

Choose Hive when:
- You need maximum performance
- Your data structure is simple
- You want minimal setup
- You're building a smaller application

## Contributing

We welcome contributions! Please follow these steps:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to your branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.