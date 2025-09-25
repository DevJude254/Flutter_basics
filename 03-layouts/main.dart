import 'package:flutter/material.dart';

void main() {
  runApp(LayoutExplorerApp());
}

class LayoutExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Explorer 🎨',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Comic Sans MS',
      ),
      home: LayoutPlayground(),
    );
  }
}

class LayoutPlayground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🏗️ Layout Playground'),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _buildSectionHeader('Welcome to Layouts! 🎉'),
            SizedBox(height: 20),
            
            // Row Example
            _buildSectionTitle('🔸 Row - Side by Side'),
            _buildRowExample(),
            SizedBox(height: 30),
            
            // Column Example
            _buildSectionTitle('🔹 Column - Top to Bottom'),
            _buildColumnExample(),
            SizedBox(height: 30),
            
            // Container Example
            _buildSectionTitle('📦 Container - The Magic Box'),
            _buildContainerExample(),
            SizedBox(height: 30),
            
            // Fun Challenge
            _buildSectionTitle('🎯 Fun Challenge Layout'),
            _buildChallengeLayout(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade300, Colors.blue.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.purple.shade700,
      ),
    );
  }

  Widget _buildRowExample() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Column(
        children: [
          Text(
            'Items in a Row (horizontal line):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildColorBox(Colors.red, '🔴'),
              _buildColorBox(Colors.green, '🟢'),
              _buildColorBox(Colors.blue, '🔵'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColumnExample() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        children: [
          Text(
            'Items in a Column (vertical line):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Column(
            children: [
              _buildColorBox(Colors.yellow, '🟡'),
              SizedBox(height: 8),
              _buildColorBox(Colors.purple, '🟣'),
              SizedBox(height: 8),
              _buildColorBox(Colors.teal, '🔷'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContainerExample() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        children: [
          Text(
            'Container - Your Creative Box:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Simple container
              Container(
                width: 80,
                height: 80,
                color: Colors.pink.shade300,
                child: Center(
                  child: Text('📦', style: TextStyle(fontSize: 30)),
                ),
              ),
              // Styled container
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.red],
                  ),
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text('✨', style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeLayout() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink.shade100, Colors.yellow.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink.shade200),
      ),
      child: Column(
        children: [
          Text(
            '🏆 Challenge: Row + Column + Container!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.pink.shade800,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Left side - Column
              Column(
                children: [
                  _buildEmojiBox('🚀', Colors.blue.shade300),
                  SizedBox(height: 8),
                  _buildEmojiBox('⭐', Colors.yellow.shade300),
                ],
              ),
              // Center - Single item
              _buildEmojiBox('🎯', Colors.red.shade300),
              // Right side - Column
              Column(
                children: [
                  _buildEmojiBox('🎨', Colors.green.shade300),
                  SizedBox(height: 8),
                  _buildEmojiBox('🎪', Colors.purple.shade300),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorBox(Color color, String emoji) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          emoji,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildEmojiBox(String emoji, Color color) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          emoji,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}