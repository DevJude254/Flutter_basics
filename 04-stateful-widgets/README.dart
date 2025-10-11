# 04 - Stateful Widgets: Managing State

## What You'll Learn
- The difference between StatelessWidget and StatefulWidget
- How to manage changing data in your app
- Using `setState()` to update the UI
- Working with mutable state variables

## Understanding State

**State** is any data that can change over time in your app. Examples include:
- A counter that increases when you tap a button
- Text typed into a form field
- Whether a checkbox is checked or not
- Items in a shopping cart

## StatelessWidget vs StatefulWidget

### StatelessWidget
- **Immutable** - Cannot change once built
- Use when your widget doesn't need to change
- Examples: static text, icons, layout structures

### StatefulWidget
- **Mutable** - Can change over time
- Use when your widget needs to respond to user interaction or data changes
- Examples: forms, animations, counters

## Anatomy of a StatefulWidget

A StatefulWidget consists of two classes:

### 1. The Widget Class
```dart
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}
```
- Defines the widget itself
- Creates the State object
- Is immutable (doesn't change)

### 2. The State Class
```dart
class _CounterPageState extends State<CounterPage> {
  int _counter = 0;  // This is the state!
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return // Your UI here
  }
}
```
- Holds the mutable state (variables that can change)
- Contains the `build()` method
- Can change over the widget's lifetime

## The Magic of `setState()`

The `setState()` method is crucial for updating the UI:

```dart
void _incrementCounter() {
  setState(() {
    _counter++;  // Modify state here
  });
}
```

**What happens:**
1. You modify state variables inside `setState()`
2. Flutter marks the widget as "dirty" (needs rebuilding)
3. Flutter calls `build()` again with the new values
4. The UI updates to show the new state

**Important:** Always modify state inside `setState()`. If you don't, the UI won't update!

```dart
// ❌ WRONG - UI won't update
void _incrementCounter() {
  _counter++;
}

// ✅ CORRECT - UI will update
void _incrementCounter() {
  setState(() {
    _counter++;
  });
}
```

## Key Concepts in This Example

### 1. State Variables
```dart
int _counter = 0;
String _message = 'Press the button to start counting!';
```
These variables hold data that changes over time.

### 2. Multiple State Updates
```dart
void _incrementCounter() {
  setState(() {
    _counter++;
    
    if (_counter == 1) {
      _message = 'Great! You clicked once.';
    } else if (_counter == 5) {
      _message = 'Wow! You\'re on fire! 🔥';
    }
  });
}
```
You can update multiple state variables in a single `setState()` call.

### 3. Conditional UI
```dart
Text(
  '$_counter',
  style: TextStyle(
    color: _counter > 5 ? Colors.green : Colors.blue,
  ),
)
```
The UI changes based on the state values.

## Naming Conventions

- State variables start with underscore: `_counter`, `_message`
- State class name starts with underscore: `_CounterPageState`
- Underscore makes them **private** to this file

## Common Patterns

### Pattern 1: Simple Toggle
```dart
bool _isVisible = true;

void _toggleVisibility() {
  setState(() {
    _isVisible = !_isVisible;
  });
}
```

### Pattern 2: Form Input
```dart
String _name = '';

void _updateName(String newName) {
  setState(() {
    _name = newName;
  });
}
```

### Pattern 3: List Management
```dart
List<String> _items = [];

void _addItem(String item) {
  setState(() {
    _items.add(item);
  });
}
```

## When to Use StatefulWidget

✅ **Use StatefulWidget when:**
- You need to respond to user input
- Data changes over time
- You're building forms
- You need animations

❌ **Use StatelessWidget when:**
- The widget never changes
- You're displaying static content
- All data is passed from parent widgets

## Try It Yourself

Experiment with the code:

1. **Add a new button** that doubles the counter
2. **Change the color** based on whether the counter is even or odd
3. **Add a new state variable** that tracks how many times the reset button was pressed
4. **Create a second counter** that counts down from 100

## Common Mistakes

1. **Forgetting `setState()`**
   ```dart
   // ❌ This won't work
   void _increment() {
     _counter++;
   }
   ```

2. **Modifying state outside `setState()`**
   ```dart
   // ❌ Don't do this
   _counter++;
   setState(() {});
   ```

3. **Calling `setState()` after dispose**
   ```dart
   // Make sure the widget is still mounted
   if (mounted) {
     setState(() {
       _counter++;
     });
   }
   ```

## Next Steps

Now that you understand state management, you're ready for:
- **05-navigation**: Moving between different screens
- **Forms and user input**: Text fields, checkboxes, etc.
- **Lists and scrolling**: Displaying dynamic lists of items

## Resources

- [Flutter State Management Documentation](https://flutter.dev/docs/development/data-and-backend/state-mgmt)
- [StatefulWidget Class](https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html)
- [setState Method](https://api.flutter.dev/flutter/widgets/State/setState.html)

---

**Remember:** State is just data that can change. `setState()` tells Flutter "hey, something changed, please update the screen!"