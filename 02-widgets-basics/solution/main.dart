import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Basics',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: WidgetBasicsHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetBasicsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter Widget Basics',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Section 1: Text Widgets
            _buildSectionTitle('📝 Text Widgets'),
            _buildTextExamples(),
            
            SizedBox(height: 30),
            
            // Section 2: Container Widgets
            _buildSectionTitle('📦 Container Widgets'),
            _buildContainerExamples(),
            
            SizedBox(height: 30),
            
            // Section 3: Icon Widgets
            _buildSectionTitle('🎨 Icon Widgets'),
            _buildIconExamples(),
            
            SizedBox(height: 30),
            
            // Section 4: Image Widgets
            _buildSectionTitle('🖼️ Image Widgets'),
            _buildImageExamples(),
            
            SizedBox(height: 30),
            
            // Section 5: Button Widgets
            _buildSectionTitle('🔘 Button Widgets'),
            _buildButtonExamples(),
            
            SizedBox(height: 30),
            
            // Section 6: Layout Widgets
            _buildSectionTitle('📐 Layout Widgets'),
            _buildLayoutExamples(),
            
          ],
        ),
      ),
    );
  }
  
  // Helper method to create section titles
  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade100, Colors.teal.shade50],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.teal.shade800,
        ),
      ),
    );
  }
  
  // Text Widget Examples
  Widget _buildTextExamples() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Text
            Text('This is basic text'),
            
            SizedBox(height: 10),
            
            // Styled Text
            Text(
              'This is styled text!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            
            SizedBox(height: 10),
            
            // Colored Background Text
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Text with background color',
                style: TextStyle(color: Colors.amber.shade800),
              ),
            ),
            
            SizedBox(height: 10),
            
            // Multiline Text
            Text(
              'This is a longer text that demonstrates how Flutter handles multiline text automatically when it runs out of space.',
              style: TextStyle(
                fontSize: 14,
                height: 1.5, // Line spacing
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Container Widget Examples
  Widget _buildContainerExamples() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Simple colored container
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red.shade300,
                  child: Center(
                    child: Text(
                      'Red',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                
                // Rounded container
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      'Rounded',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                
                // Circular container
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.green.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      'Circle',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 20),
            
            // Gradient container
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.pink],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Gradient Container',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Icon Widget Examples
  Widget _buildIconExamples() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Row of basic icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Icon(Icons.favorite, size: 40, color: Colors.red),
                Icon(Icons.star, size: 40, color: Colors.amber),
                Icon(Icons.person, size: 40, color: Colors.green),
              ],
            ),
            
            SizedBox(height: 20),
            
            // Icons with containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconContainer(Icons.email, Colors.blue, 'Email'),
                _buildIconContainer(Icons.phone, Colors.green, 'Phone'),
                _buildIconContainer(Icons.location_on, Colors.red, 'Location'),
                _buildIconContainer(Icons.camera, Colors.purple, 'Camera'),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  // Helper method for icon containers
  Widget _buildIconContainer(IconData icon, Color color, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 30, color: color),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
  
  // Image Widget Examples
  Widget _buildImageExamples() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Image placeholders (use actual images in real apps)',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade600,
              ),
            ),
            
            SizedBox(height: 15),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Placeholder image containers
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.image,
                    size: 40,
                    color: Colors.grey.shade600,
                  ),
                ),
                
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.grey.shade600,
                  ),
                ),
                
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.photo_camera,
                    size: 40,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 10),
            
            Text(
              'Square Image    Circle Avatar    Camera Photo',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
  
  // Button Widget Examples
  Widget _buildButtonExamples() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Elevated Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Elevated button pressed!');
                  },
                  child: Text('Elevated'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                
                ElevatedButton.icon(
                  onPressed: () {
                    print('Icon button pressed!');
                  },
                  icon: Icon(Icons.favorite),
                  label: Text('With Icon'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 15),
            
            // Text Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    print('Text button pressed!');
                  },
                  child: Text('Text Button'),
                ),
                
                OutlinedButton(
                  onPressed: () {
                    print('Outlined button pressed!');
                  },
                  child: Text('Outlined'),
                ),
              ],
            ),
            
            SizedBox(height: 15),
            
            // Floating Action Button
            FloatingActionButton(
              onPressed: () {
                print('FAB pressed!');
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
  
  // Layout Widget Examples
  Widget _buildLayoutExamples() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Row Layout (Horizontal):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 10),
            
            // Row example
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red.shade300,
                    child: Center(child: Text('1')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green.shade300,
                    child: Center(child: Text('2')),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.blue.shade300,
                    child: Center(child: Text('3')),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            Text(
              'Column Layout (Vertical):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            
            SizedBox(height: 10),
            
            // Column example
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 60,
                        height: 40,
                        color: Colors.orange.shade300,
                        child: Center(child: Text('A')),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 60,
                        height: 40,
                        color: Colors.purple.shade300,
                        child: Center(child: Text('B')),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: 60,
                        height: 40,
                        color: Colors.teal.shade300,
                        child: Center(child: Text('C')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}