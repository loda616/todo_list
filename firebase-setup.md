# Firebase Setup Guide for Flutter Todo App

## Prerequisites
- Flutter SDK installed
- Firebase account
- Android Studio / VS Code
- A Flutter project created

## Step 1: Install Firebase CLI
```bash
npm install -g firebase-tools
```

## Step 2: Install FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
```

## Step 3: Configure Your Flutter Project

1. Add Firebase dependencies to `pubspec.yaml`:
```yaml
dependencies:
  firebase_core: ^2.24.2
  firebase_auth: ^4.15.3
  cloud_firestore: ^4.13.6
```

2. Run:
```bash
flutter pub get
```

## Step 4: Firebase Console Setup

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project" or select existing project
3. Enter project name (e.g., "Todo App")
4. Enable/disable Google Analytics (optional)
5. Click "Create project"

## Step 5: Add Your Flutter App to Firebase

### For Android:

1. In Firebase Console:
   - Click "Add app"
   - Select Android
   - Enter Android package name (found in android/app/build.gradle)
   - Enter app nickname (optional)
   - Download `google-services.json`

2. Place `google-services.json` in:
   ```
   android/app/google-services.json
   ```

3. Modify `android/build.gradle`:
```gradle
buildscript {
    dependencies {
        classpath 'com.google.gms:google-services:4.4.0'
    }
}
```

4. Modify `android/app/build.gradle`:
```gradle
apply plugin: 'com.google.gms.google-services'

android {
    defaultConfig {
        minSdkVersion 21
    }
}
```

### For iOS:

1. In Firebase Console:
   - Click "Add app"
   - Select iOS
   - Enter Bundle ID (found in Runner.xcodeproj/project.pbxproj)
   - Download `GoogleService-Info.plist`

2. Place `GoogleService-Info.plist` in:
   ```
   ios/Runner/GoogleService-Info.plist
   ```

3. Add to iOS Xcode project using Xcode

## Step 6: Initialize Firebase in Flutter

1. Create `lib/firebase_options.dart`:
```bash
flutterfire configure
```

2. Update `lib/main.dart`:
```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
```

## Step 7: Enable Authentication

1. In Firebase Console:
   - Go to Authentication
   - Click "Get Started"
   - Enable Email/Password sign-in method

## Step 8: Create Firestore Database

1. In Firebase Console:
   - Go to Firestore Database
   - Click "Create Database"
   - Choose starting mode (test mode or production mode)
   - Select database location
   - Click "Enable"

2. Set up security rules:
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /todos/{todoId} {
      allow read, write: if request.auth != null && request.auth.uid == resource.data.userId;
    }
  }
}
```

## Step 9: Test Firebase Connection

Add this test code to verify your setup:

```dart
import 'package:firebase_core/firebase_core.dart';

Future<void> testFirebaseConnection() async {
  try {
    await Firebase.initializeApp();
    print('Firebase initialized successfully');
  } catch (e) {
    print('Firebase initialization error: $e');
  }
}
```

## Common Issues and Solutions

### Android Build Issues:
- If you get multidex issues, add this to android/app/build.gradle:
```gradle
android {
    defaultConfig {
        multiDexEnabled true
    }
}
```

### iOS Build Issues:
- Run `pod install` in ios folder
- Minimum iOS version should be 11.0 or higher
- Add Privacy Description in Info.plist if using certain Firebase features

### General Troubleshooting:
1. Clean project:
```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
```

2. Check Firebase initialization:
```dart
await Firebase.initializeApp();
print('Firebase initialized: ${Firebase.apps.length > 0}');
```

## Security Best Practices

1. Keep google-services.json and GoogleService-Info.plist secure
2. Use proper security rules in Firestore
3. Implement proper user authentication checks
4. Use environment variables for sensitive data
5. Regular security rule audits

## Next Steps

After setup:
1. Implement authentication logic
2. Set up Firestore collections
3. Create CRUD operations
4. Test all Firebase features
5. Monitor Firebase Console for usage and errors