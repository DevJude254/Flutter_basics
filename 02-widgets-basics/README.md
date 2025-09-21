# 02-widgets-basics - Understanding Widgets

## 📚 What You'll Learn
- Different types of Flutter widgets
- Text styling and customization
- Container properties and decoration
- Working with icons and images
- Button types and interactions
- Basic layout widgets (Row, Column)

## 🎯 Learning Objectives
By the end of this lesson, you'll be able to:
- Use various Flutter widgets confidently
- Style text with different fonts, colors, and sizes
- Create attractive containers with colors, borders, and shadows
- Display icons and handle button interactions
- Arrange widgets horizontally and vertically

---

## 🧱 Widget Fundamentals

### What are Widgets?
In Flutter, **everything is a widget**! Widgets are the building blocks of your UI:
- Text → `Text()` widget
- Buttons → `ElevatedButton()` widget  
- Images → `Image()` widget
- Layout → `Row()`, `Column()` widgets

### Widget Tree Concept
```
MyApp (root widget)
└── MaterialApp
    └── Scaffold
        ├── AppBar
        │   └── Text
        └── Body
            └── Column
                ├── Text
                ├── Container
                └── ElevatedButton
```

---

## 📝 Text Widgets

### Basic Text
```dart
Text('Hello, Flutter!')
```

### Styled Text
```dart
Text(
  'Styled Text!',
  style: TextStyle(
    fontSize: 24,              // Size of text
    fontWeight: FontWeight.bold,   // Make it bold
    color: Colors.blue,        // Text color
    fontStyle: FontStyle.italic,   // Make it italic
  ),
)
```

### Common Text Properties
| Property | Description | Example |
|----------|-------------|---------|
| `fontSize` | Size of the text | `fontSize: 20` |
| `fontWeight` | Thickness of text | `FontWeight.bold` |
| `color` | Text color | `Colors.red` |
| `fontStyle` | Italic or normal | `FontStyle.italic` |
| `decoration` | Underline, strikethrough | `TextDecoration.underline` |

### Practice Exercise 1: Text Styling
Create different text widgets with:
1. Your name in large, bold text
2. Your age in blue color
3. Your favorite quote in italic
4. A title with underline decoration

---

## 📦 Container Widgets

### Basic Container
```dart
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: Text('Inside Container'),
)
```

### Advanced Container
```dart
Container(
  width: 150,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(10),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color: Colors.black, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.grey,
        blurRadius: 5,
        offset: Offset(2, 2),
      ),
    ],
  ),
  child: Center(
    child: Text(
      'Fancy Container',
      style: TextStyle(color: Colors.white),
    ),
  ),
)
```

### Container Properties Explained
- **width/height**: Size of the container
- **color**: Background color (simple)
- **padding**: Space inside the container
- **margin**: Space outside the container
- **decoration**: Advanced styling (gradients, borders, shadows)

### Practice Exercise 2: Container Creation
Create containers with:
1. Different background colors
2. Rounded corners
3. Shadows
4. Borders

---

## 🎨 Icon Widgets

### Basic Icons
```dart
Icon(
  Icons.favorite,    // Heart icon
  size: 50,          // Icon size
  color: Colors.red, // Icon color
)
```

### Popular Icons
```dart
// Common icons you'll use
Icon(Icons.home)           // House
Icon(Icons.person)         // Person
Icon(Icons.email)          // Email
Icon(Icons.phone)          // Phone  
Icon(Icons.star)           // Star
Icon(Icons.favorite)       // Heart
Icon(Icons.shopping_cart)  // Shopping cart
Icon(Icons.camera)         // Camera
```

### Icons with Containers
```dart
Container(
  width: 60,
  height: 60,
  decoration: BoxDecoration(
    color: Colors.blue.shade100,
    borderRadius: BorderRadius.circular(30),
  ),
  child: Icon(
    Icons.person,
    size: 30,
    color: Colors.blue,
  ),
)
```

### Practice Exercise 3: Icon Gallery
Create a row of icons representing:
1. Home, Search, Profile, Settings
2. Each icon in a different colored container
3. Different sizes for each icon

---

## 🖼️ Image Widgets

### Network Images (from internet)
```dart
Image.network(
  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)
```

### Asset Images (from your project)
```dart
// First add image to pubspec.yaml under assets:
Image.asset(
  'assets/images/my_image.png',
  width: 150,
  height: 150,
)
```

### Image Placeholder (for learning)
```dart
Container(
  width: 100,
  height: 100,
  color: Colors.grey.shade300,
  child: Icon(
    Icons.image,
    size: 50,
    color: Colors.grey.shade600,
  ),
)
```

### Practice Exercise 4: Image Gallery
Create different image displays:
1. Square image placeholder
2. Circular avatar placeholder
3. Rectangular banner placeholder

---

## 🔘 Button Widgets

### ElevatedButton (Most Common)
```dart
ElevatedButton(
  onPressed: () {
    print('Button pressed!');
  },
  child: Text('Tap Me'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,     // Button color
    foregroundColor: Colors.white,    // Text color
    padding: EdgeInsets.symmetric(
      horizontal: 20, 
      vertical: 12
    ),
  ),
)
```

### TextButton (Flat)
```dart
TextButton(
  onPressed: () {
    print('Text button pressed!');
  },
  child: Text('Text Button'),
)
```

### OutlinedButton
```dart
OutlinedButton(
  onPressed: () {
    print('Outlined button pressed!');
  },
  child: Text('Outlined Button'),
)
```

### IconButton
```dart
IconButton(
  onPressed: () {
    print('Icon button pressed!');
  },
  icon: Icon(Icons.favorite),
)
```

### Button with Icon and Text
```dart
ElevatedButton.icon(
  onPressed: () {
    print('Button with icon pressed!');
  },
  icon: Icon(Icons.download),
  label: Text('Download'),
)
```

### Practice Exercise 5: Button Collection
Create different buttons:
1. A "Like" button with heart icon
2. A "Share" button with share icon  
3. A "Save" outlined button
4. A simple text button for "Cancel"

---

## 📐 Layout Widgets: Row and Column

### Column (Vertical Layout)
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,    // Vertical alignment
  crossAxisAlignment: CrossAxisAlignment.center,  // Horizontal alignment
  children: [
    Text('First Item'),
    Text('Second Item'),
    Text('Third Item'),
  ],
)
```

### Row (Horizontal Layout)
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,  // Horizontal alignment
  crossAxisAlignment: CrossAxisAlignment.center,     // Vertical alignment
  children: [
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.person),
  ],
)
```

### Alignment Options
**MainAxisAlignment** (primary direction):
- `center` - Center everything
- `start` - Align to start
- `end` - Align to end
- `spaceEvenly` - Equal space between items
- `spaceBetween` - Space between items, no space at edges

**CrossAxisAlignment** (secondary direction):
- `center` - Center in cross direction
- `start` - Align to start of cross axis
- `end` - Align to end of cross axis
- `stretch` - Stretch to fill cross axis

### Practice Exercise 6: Layout Challenge
Create:
1. A row of 3 colored containers
2. A column of 4 different icons
3. A row with a text and button
4. A column with an icon, text, and button

---

## 🎓 Step-by-Step Tutorial

### Step 1: Run the Complete Example
1. Copy the solution code to your Flutter project
2. Run the app: `flutter run`
3. Explore each section of the app

### Step 2: Experiment with Properties
Try changing these properties:
```dart
// Text properties
fontSize: 30,           // Try different sizes
color: Colors.purple,   // Try different colors
fontWeight: FontWeight.w300,  // Try different weights

// Container properties  
width: 200,             // Try different sizes
color: Colors.green,    // Try different colors
borderRadius: BorderRadius.circular(25),  // Try different radius

// Icon properties
size: 40,               // Try different sizes
color: Colors.orange,   // Try different colors
```

### Step 3: Break and Fix
Intentionally break something to learn:
1. Remove a semicolon and see the error
2. Use wrong color name and fix it
3. Try invalid property values

### Step 4: Build Your Own Widget Gallery
Create your own version with:
- Your favorite colors
- Your preferred icons
- Your own text content
- Your own container designs

---

## 💡 Key Concepts to Remember

### 1. Widget Properties
Every widget has properties that control its appearance:
```dart
Text(
  'Hello',           // Content (required)
  style: TextStyle(  // Styling (optional)
    color: Colors.blue,
  ),
)
```

### 2. Parent-Child Relationships
Widgets can contain other widgets:
```dart
Container(              // Parent widget
  child: Text('Hello'), // Child widget  
)
```

### 3. Lists of Widgets
Some widgets take multiple children:
```dart
Column(
  children: [           // List of child widgets
    Text('First'),
    Text('Second'),
    Text('Third'),
  ],
)
```

---

## 🎯 Practice Challenges

### Beginner Challenges
1. **Personal Card**: Create a card with your name, age, and favorite emoji
2. **Color Palette**: Make containers showing your 5 favorite colors
3. **Icon Menu**: Create a row of 4 icons representing different app sections

### Intermediate Challenges
1. **Profile Preview**: Combine avatar, name, bio, and action buttons
2. **Product Card**: Show product image, name, price, and buy button
3. **Social Media Post**: Create a simple post layout with user info and content

### Advanced Challenges
1. **Settings Menu**: Create a list of settings items with icons and descriptions
2. **Dashboard**: Design a dashboard with different widgets and information
3. **Custom Theme**: Create a consistent color scheme across all widgets

---

## 🔍 Common Mistakes & Solutions

### Mistake 1: Forgetting Child Property
```dart
// ❌ Wrong
Container(
  Text('Hello'),  // This doesn't work
)

// ✅ Correct
Container(
  child: Text('Hello'),  // Use child: property
)
```

### Mistake 2: Missing Parentheses
```dart
// ❌ Wrong  
Text('Hello'
style: TextStyle(color: Colors.blue),
)

// ✅ Correct
Text(
  'Hello',
  style: TextStyle(color: Colors.blue),
)
```

### Mistake 3: Wrong Color Usage
```dart
// ❌ Wrong
color: blue,  // Not defined

// ✅ Correct
color: Colors.blue,  // Use Colors.colorName
```

### Mistake 4: Overflow Issues
```dart
// ❌ Can cause overflow
Row(
  children: [
    Container(width: 200, height: 50, color: Colors.red),
    Container(width: 200, height: 50, color: Colors.blue),
    Container(width: 200, height: 50, color: Colors.green),
  ],
)

// ✅ Better approach
Row(
  children: [
    Expanded(child: Container(height: 50, color: Colors.red)),
    Expanded(child: Container(height: 50, color: Colors.blue)),  
    Expanded(child: Container(height: 50, color: Colors.green)),
  ],
)
```

---

## 📚 Additional Resources

### Flutter Widget Catalog
- [Official Widget Catalog](https://flutter.dev/docs/development/ui/widgets)
- [Material Design Components](https://flutter.dev/docs/development/ui/material)

### Helpful Tools
- **Flutter Inspector**: See widget tree in your IDE
- **Hot Reload**: Instantly see changes (Ctrl+S / Cmd+S)
- **Widget Documentation**: Hover over widgets in your IDE

### Color Resources  
- [Material Colors](https://material.io/design/color/the-color-system.html)
- [Colors class documentation](https://api.flutter.dev/flutter/material/Colors-class.html)

---

## 🎊 Next Steps

Congratulations! You now understand Flutter widgets. You should be comfortable with:
- ✅ Creating and styling text
- ✅ Making colorful containers  
- ✅ Using icons effectively
- ✅ Adding interactive buttons
- ✅ Arranging widgets in rows and columns

**Ready for the next lesson?** → [03-layouts](../03-layouts/)

In the next lesson, you'll learn how to create beautiful, complex layouts by combining these widgets in sophisticated ways!

---

## 🔧 Quick Reference

### Most Used Widgets
```dart
Text('Hello')                    // Display text
Container()                      // Box with styling
Icon(Icons.home)                // Display icon  
ElevatedButton()                // Clickable button
Row()                           // Horizontal layout
Column()                        // Vertical layout
```

### Most Used Properties
```dart
color: Colors.blue              // Set color
fontSize: 20                    // Text size  
width: 100                      // Widget width
height: 50                      // Widget height
padding: EdgeInsets.all(16)     // Internal spacing
margin: EdgeInsets.all(10)      // External spacing
```

Happy widget building! 🎨📱