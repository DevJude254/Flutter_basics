# 01-hello-world - Your First Flutter App

## 📚 What You'll Learn
- Create your first Flutter app
- Understand the basic Flutter app structure
- Learn about MaterialApp and Scaffold
- Customize text and colors
- Use Hot Reload

## 🎯 Learning Objectives
By the end of this lesson, you'll be able to:
- Create a new Flutter project
- Modify the app's title and content
- Change colors and text styles
- Use Flutter's hot reload feature

---

## 📂 Files in this lesson:

### `/starter/main.dart` - Starting Template
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
```

### `/solution/main.dart` - Complete Solution
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My First Flutter App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
        elevation: 8,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade100, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Main greeting
              Text(
                'Hello, Flutter!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade800,
                ),
              ),
              
              SizedBox(height: 20),
              
              // Subtitle
              Text(
                'Welcome to your first Flutter app!',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.purple.shade600,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 40),
              
              // Icon
              Icon(
                Icons.flutter_dash,
                size: 100,
                color: Colors.purple.shade400,
              ),
              
              SizedBox(height: 20),
              
              // Fun fact
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple.shade200),
                ),
                child: Text(
                  '🎉 Fun Fact: Flutter can build apps for iOS, Android, Web, and Desktop from a single codebase!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.purple.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // We'll learn about this in later lessons!
          print('Hello from Flutter!');
        },
        child: Icon(Icons.thumb_up),
        backgroundColor: Colors.purple,
      ),
    );
  }
}
```

---

## 🎓 Step-by-Step Tutorial

### Step 1: Create Your Project
```bash
flutter create hello_world_app
cd hello_world_app
code . # Opens in VS Code
```

### Step 2: Understanding the Code Structure

**The `main()` function:**
```dart
void main() {
  runApp(MyApp()); // This starts your app
}
```

**The `MyApp` class:**
```dart
class MyApp extends StatelessWidget {
  // StatelessWidget means this won't change
  @override
  Widget build(BuildContext context) {
    return MaterialApp(/* your app here */);
  }
}
```

**Key Components:**
- `MaterialApp`: The root of your app
- `Scaffold`: Provides basic app structure
- `AppBar`: The top bar of your app
- `body`: Main content area

### Step 3: Customize Your App

**Change the title:**
```dart
appBar: AppBar(
  title: Text('Your Custom Title Here'),
),
```

**Change colors:**
```dart
theme: ThemeData(
  primarySwatch: Colors.blue, // Try: red, green, orange, purple
),
```

**Style your text:**
```dart
Text(
  'Hello, Flutter!',
  style: TextStyle(
    fontSize: 32,           // Size of text
    fontWeight: FontWeight.bold,  // Make it bold
    color: Colors.blue,     // Text color
  ),
),
```

### Step 4: Practice Exercises

1. **Easy**: Change the app title to your name
2. **Easy**: Change the main text color to your favorite color
3. **Medium**: Add an icon below the text
4. **Medium**: Add a container with background color
5. **Hard**: Create a gradient background

---

## 🧠 Key Concepts Explained

### Widgets
- Everything in Flutter is a widget
- Widgets are like building blocks
- You combine widgets to create your UI

### Hot Reload
- Save your file (Ctrl+S / Cmd+S)
- Your app updates instantly!
- No need to restart the app

### Material Design
- Flutter's default design system
- Provides consistent look and feel
- Works great on both iOS and Android

---

## 🎯 Challenges

### Challenge 1: Personal Greeting
Create an app that shows:
- Your name as the main title
- Your favorite color as the theme
- A personal message about learning Flutter

### Challenge 2: Fun Facts App
Create an app that displays:
- A fun fact about yourself
- Your favorite emoji as an icon
- A colorful background

### Challenge 3: Color Explorer
Experiment with different colors:
- Try all primary colors (red, blue, green, etc.)
- Mix different text and background colors
- Find your favorite color combination

---

## 🔍 Common Mistakes & Solutions

**Problem**: Red squiggly lines under code
**Solution**: Missing semicolon `;` at the end of lines

**Problem**: App doesn't update
**Solution**: Make sure you saved the file and hot reload is working

**Problem**: Text is too small/big
**Solution**: Adjust the `fontSize` property

**Problem**: Colors don't work
**Solution**: Make sure to use `Colors.colorName` (e.g., `Colors.blue`)

---

## 🎊 Next Steps

Great job completing your first Flutter app! Next, you'll learn about:
- Different types of widgets
- How to arrange widgets in layouts
- Making your app interactive

**Ready for the next lesson?** → [02-widgets-basics](../02-widgets-basics/)

---


**Remember**: The most important thing is that YOUR app reflects YOUR style! 🎨