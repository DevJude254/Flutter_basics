import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

// This is a StatefulWidget - it can change over time
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

// This is the State class that holds the mutable data
class _CounterPageState extends State<CounterPage> {
  // This variable will change when we tap the button
  int _counter = 0;
  String _message = 'Press the button to start counting!';

  // This method updates the state
  void _incrementCounter() {
    setState(() {
      // setState tells Flutter to rebuild the widget with new values
      _counter++;
      
      // Update message based on counter value
      if (_counter == 1) {
        _message = 'Great! You clicked once.';
      } else if (_counter == 5) {
        _message = 'Wow! You\'re on fire! 🔥';
      } else if (_counter == 10) {
        _message = 'Double digits! Amazing! 🎉';
      } else if (_counter > 10) {
        _message = 'You\'re a clicking champion! 🏆';
      } else {
        _message = 'Keep going!';
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        _message = 'Going down!';
      } else {
        _message = 'Can\'t go below zero!';
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _message = 'Counter reset! Start again.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // This text changes when _counter changes
            Text(
              '$_counter',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: _counter > 5 ? Colors.green : Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            // This message changes based on the counter value
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _message,
                style: const TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            // Multiple buttons to demonstrate different state changes
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _resetCounter,
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}