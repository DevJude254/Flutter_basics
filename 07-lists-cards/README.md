# 🗂️ Session 07: Lists and Cards

Welcome to the world of scrolling! This is where you learn to display lots of data beautifully. 📜✨

## 🎯 What You'll Learn

- ✅ **ListView.builder** - Efficiently display long lists
- ✅ **GridView.builder** - Display items in a grid layout
- ✅ **Card Widget** - Material design cards
- ✅ **ListTile** - Pre-styled list items
- ✅ **Model Classes** - Organize your data
- ✅ **Dynamic Lists** - Lists that change based on data
- ✅ **List vs Grid Toggle** - Switch between views

---

## 🎨 What This App Does

A **Product Store** with:
- List of 10 products with details
- Beautiful cards for each product
- Toggle between List View and Grid View
- Tap any product to see full details
- Star ratings and category badges
- "Add to Cart" functionality

**Try it:** Run the app and click the grid icon in the AppBar to switch views! 🔄

---

## 📚 Concept Breakdown

### 1️⃣ **Model Class - Organizing Your Data**

```dart
class Product {
  final String name;
  final double price;
  final String image;
  
  Product({
    required this.name,
    required this.price,
    required this.image,
  });
}
```

**What it does:** A blueprint for your data structure

**Why use it?**
- Organizes related data together
- Makes code cleaner and easier to understand
- Prevents mistakes (can't accidentally use wrong type)

**Like a form:** Each product fills out the same fields - name, price, etc.

---

### 2️⃣ **List of Data**

```dart
final List<Product> products = [
  Product(name: 'Laptop', price: 999.99, image: '💻'),
  Product(name: 'Phone', price: 699.99, image: '📱'),
  // More products...
];
```

**What it is:** An array/collection of Product objects

**In real apps:** This data usually comes from:
- API calls (internet)
- Database (local storage)
- User input (forms)

---

### 3️⃣ **ListView.builder - The Smart Scroller**

```dart
ListView.builder(
  itemCount: products.length,          // How many items?
  itemBuilder: (context, index) {      // Build each item
    final product = products[index];   // Get item at position
    return Card(...);                  // Return the widget
  },
)
```

**How it works:**
1. Flutter asks: "How many items?" → `itemCount: 10`
2. Flutter builds items as you scroll
3. For each item, calls `itemBuilder` with the index (0, 1, 2...)
4. You return the widget for that position

**Why .builder is AWESOME:**
- ✅ Only builds visible items (super efficient!)
- ✅ Works with 10 items or 10,000 items
- ✅ Smooth scrolling performance

**vs Regular ListView:**
```dart
// ❌ BAD - Builds ALL items at once
ListView(
  children: [
    Card(), Card(), Card(), // ... 1000 cards
  ],
)

// ✅ GOOD - Builds only what's visible
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) => Card(),
)
```

---

### 4️⃣ **Card Widget - Beautiful Containers**

```dart
Card(
  elevation: 3,        // Shadow depth
  margin: EdgeInsets.all(8),
  child: Padding(
    padding: EdgeInsets.all(12),
    child: Text('Card content'),
  ),
)
```

**Properties:**
- `elevation` - How high the shadow (0-24)
- `margin` - Space OUTSIDE the card
- `shape` - Border radius and style
- `color` - Background color

**Why use Cards?**
- Material Design standard
- Automatic shadows
- Groups related content
- Makes UI look professional

---

### 5️⃣ **ListTile - Pre-styled List Item**

```dart
ListTile(
  leading: Icon(Icons.person),      // Left side
  title: Text('John Doe'),          // Main text
  subtitle: Text('Developer'),      // Below main
  trailing: Icon(Icons.arrow_forward), // Right side
  onTap: () {
    print('Tapped!');
  },
)
```

**Structure:**
```
┌────────────────────────────────┐
│ [icon]  John Doe          [→] │
│         Developer              │
└────────────────────────────────┘
 leading  title/subtitle  trailing
```

**Benefits:**
- Pre-defined layout
- Consistent spacing
- Touch ripple effect
- Easy to use

---

### 6️⃣ **GridView.builder - Grid Layout**

```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,        // Number of columns
    childAspectRatio: 0.75,   // Width/Height ratio
    crossAxisSpacing: 8,      // Space between columns
    mainAxisSpacing: 8,       // Space between rows
  ),
  itemCount: products.length,
  itemBuilder: (context, index) {
    return Card(...);
  },
)
```

**Grid Configuration:**
- `crossAxisCount: 2` → 2 columns
- `crossAxisCount: 3` → 3 columns
- `childAspectRatio` → Shape of cells
  - `1.0` = Square
  - `0.75` = Taller than wide
  - `1.5` = Wider than tall

**Visual:**
```
crossAxisCount: 2       crossAxisCount: 3
┌─────┬─────┐          ┌───┬───┬───┐
│  1  │  2  │          │ 1 │ 2 │ 3 │
├─────┼─────┤          ├───┼───┼───┤
│  3  │  4  │          │ 4 │ 5 │ 6 │
└─────┴─────┘          └───┴───┴───┘
```

---

### 7️⃣ **Accessing List Items by Index**

```dart
itemBuilder: (context, index) {
  final product = products[index];  // Get item at position
  
  return Text(product.name);
}
```

**Index explained:**
```dart
products[0] → First item (Laptop)
products[1] → Second item (Headphones)
products[2] → Third item (Watch)
```

**Remember:** Indices start at 0, not 1!

---

### 8️⃣ **Showing Dialogs**

```dart
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('Product Details'),
    content: Text('Description here'),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text('Close'),
      ),
    ],
  ),
)
```

**Parts:**
- `title` - Top text
- `content` - Main content (can be any widget!)
- `actions` - Bottom buttons

**Close dialog:** `Navigator.pop(context)`

---

### 9️⃣ **Conditional Rendering - Toggle Views**

```dart
bool _isGridView = false;

// In build method:
_isGridView ? _buildGridView() : _buildListView()
```

**The `? :` operator (ternary):**
```
condition ? if_true : if_false
```

**Example:**
```dart
_isGridView = true  → Shows GridView
_isGridView = false → Shows ListView
```

**Toggle the value:**
```dart
setState(() {
  _isGridView = !_isGridView;  // Flip true↔false
});
```

---

## 🎮 Try These Challenges!

### Beginner
1. ✏️ Add 5 more products to the list
2. 🎨 Change the card elevation and colors
3. 📝 Add a "Sale" badge to products under $100

### Intermediate
4. 🔍 Add a search bar to filter products
5. 🏷️ Add category filter buttons (All, Electronics, Home, etc.)
6. 💰 Sort products by price (low to high, high to low)

### Advanced
7. 🛒 Create a shopping cart that saves selected items
8. ❤️ Add a favorite/wishlist feature
9. 📊 Show product count for each category

---

## 🐛 Common Mistakes & Fixes

### Mistake 1: Using ListView instead of ListView.builder
```dart
// ❌ WRONG - Inefficient for long lists
ListView(
  children: products.map((p) => Card()).toList(),
)

// ✅ CORRECT - Efficient lazy loading
ListView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) => Card(),
)
```

### Mistake 2: Forgot itemCount
```dart
// ❌ WRONG - List never ends!
ListView.builder(
  itemBuilder: (context, index) => Card(),
)

// ✅ CORRECT
ListView.builder(
  itemCount: products.length,
  itemBuilder: (context, index) => Card(),
)
```

### Mistake 3: Wrong index access
```dart
// ❌ WRONG - Index out of bounds!
final product = products[index + 1];

// ✅ CORRECT
final product = products[index];
```

### Mistake 4: Forgot padding for scrollable content
```dart
// ❌ WRONG - Content touches edges
ListView.builder(...)

// ✅ CORRECT - Nice spacing
ListView.builder(
  padding: EdgeInsets.all(8),
  ...
)
```

---

## 📖 Key Concepts Cheat Sheet

| Widget/Concept | Purpose | When to Use |
|----------------|---------|-------------|
| **ListView.builder** | Scrollable list | Lists with many items |
| **GridView.builder** | Scrollable grid | Gallery-style layouts |
| **Card** | Material container | Group related content |
| **ListTile** | Pre-styled list item | Quick list layouts |
| **Model Class** | Data structure | Organize related data |
| **itemBuilder** | Build list items | Create widgets dynamically |
| **itemCount** | Number of items | Tell Flutter list length |
| **index** | Item position | Access specific item |

---

## 🔗 Helpful Resources

### Official Flutter Docs
- [ListView Class](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- [GridView Class](https://api.flutter.dev/flutter/widgets/GridView-class.html)
- [Card Widget](https://api.flutter.dev/flutter/material/Card-class.html)
- [Working with Lists](https://docs.flutter.dev/cookbook/lists/long-lists)

### Video Tutorials
- [ListView.builder Explained](https://www.youtube.com/watch?v=KJpkjHGiI5A)
- [GridView Tutorial](https://www.youtube.com/watch?v=bLOtZDTm4H8)
- [Cards & ListTiles](https://www.youtube.com/watch?v=1Y7HgZJOxF0)

### Practice
- [DartPad - Test Lists](https://dartpad.dev)
- [Flutter Gallery](https://gallery.flutter.dev) - See list examples

---

## 💡 Pro Tips

1. **Always use .builder for lists** - Even if you have 10 items now, you might have 1000 later!
2. **Use model classes** - Makes your code organized and professional
3. **Add padding** - Lists look better with spacing
4. **Use ListView.separated** - For lists with dividers between items
5. **Test with different data** - Empty lists, 1 item, 100 items
6. **Add loading states** - Show spinner while fetching data

---

## 🎯 ListView Variants You'll See

### ListView.builder (What we used)
```dart
ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) => Card(),
)
```
**Use:** Most common, efficient for any size

### ListView.separated
```dart
ListView.separated(
  itemCount: 10,
  itemBuilder: (context, index) => Card(),
  separatorBuilder: (context, index) => Divider(),
)
```
**Use:** When you want dividers between items

### ListView (Basic)
```dart
ListView(
  children: [Card(), Card(), Card()],
)
```
**Use:** Only for small, fixed lists (< 10 items)

---

## 🤔 Quick Quiz

Test yourself:
1. What's the difference between ListView and ListView.builder?
2. What does `index` represent in itemBuilder?
3. When should you use GridView instead of ListView?
4. What are the three parts of a ListTile?

**Answers:**
1. ListView builds all items at once; .builder builds only visible items
2. The position of the item in the list (0, 1, 2...)
3. When you want multiple columns (gallery, products, etc.)
4. leading, title/subtitle, trailing

---

## 🎓 What's Next?

Now you can:
- Display any amount of data efficiently
- Create product catalogs
- Build social media feeds
- Make photo galleries
- Show chat messages

**Next Session:** Navigation & Routing - moving between screens! 🚀

Keep building! Every app uses lists. 📱