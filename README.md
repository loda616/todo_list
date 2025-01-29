# Flutter Todo List App

A feature-rich Todo List application built with Flutter, demonstrating two different local storage implementations: SQLite . This project showcases best practices in Flutter development, state management, and local data persistence.

## Features

The application includes the following features:
- Create, read, update, and delete tasks
- Mark tasks as complete/incomplete
- Dark mode support
- Calendar integration for task scheduling
- Two storage implementations (SQLite )
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

## Setup Instructions

1. Clone the repository
2. Choose your preferred storage implementation:
    - For SQLite: Check out the `sqlite` branch
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


### When to Choose Which

Choose SQLite when:
- You need complex queries
- Your data has many relationships
- ACID compliance is important
- You're building a larger application
- 
## Contributing

We welcome contributions! Please follow these steps:
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to your branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.