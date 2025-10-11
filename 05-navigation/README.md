# 05 - Navigation: Moving Between Screens

## 🎯 What You'll Learn
- How to navigate between different screens
- Passing data to new screens
- Getting data back from screens
- Understanding the navigation stack
- Multiple navigation patterns

---

## 🚀 The Navigator Stack

Think of navigation like a **stack of cards**:
- Each screen is a card
- `push()` adds a new card on top
- `pop()` removes the top card
- You always see the top card (current screen)

```
[Home Screen]              <- Bottom of stack
[Space Screen]             <- Middle
[Gift Screen]              <- Top (visible)
```

---

## 🎮 Four Ways to Navigate

### 1️⃣ Simple Navigation (Push & Pop)

**Going Forward:**
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SpacePage(),
  ),
);
```

**Going Back:**
```dart
Navigator.pop(context);
```

**When to use:** Basic navigation between screens

---

### 2️⃣ Passing Data to a Screen

**Sending data:**
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const GiftPage(
      senderName: 'You',
      giftType: '🎁 Mystery Box',
    ),
  ),
);
```

**Receiving data in the new screen:**
```dart
class GiftPage extends StatelessWidget {
  final String senderName;
  final String giftType;

  const GiftPage({
    super.key,
    required this.senderName,
    required this.giftType,
  });
  // Now you can use senderName and giftType!
}
```

**When to use:** When the next screen needs information from the current screen

---

### 3️⃣ Getting Data Back (Async Navigation)

**Navigating and waiting for result:**
```dart
final result = await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const RatingPage(),
  ),
);

// Use the result!
print('User selected: $result');
```

**Returning data from the screen:**
```dart
// In RatingPage
Navigator.pop(context, _selectedRating);
```

**When to use:** Forms, selections, or when you need user input from another screen

---

### 4️⃣ Advanced Navigation

**Pop to a specific screen:**
```dart
// Go back to home (first screen)
Navigator.popUntil(context, (route) => route.isFirst);
```

**Remove and replace current screen:**
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const NewPage()),
);
```

**When to use:** Complex navigation flows, login systems, or clearing navigation history

---

## 🎨 Key Concepts Explained

### MaterialPageRoute
This creates the transition animation between screens:
```dart
MaterialPageRoute(
  builder: (context) => const YourPage(),
)
```
- The `builder` function returns your widget
- It automatically handles the "slide from right" animation
- The back button is added automatically

### The Context Parameter
```dart
Navigator.push(context, ...)
```
- `context` tells Flutter where you are in the widget tree
- It's needed to know which screen to navigate from
- Always passed automatically to `build()` methods

### Async/Await
```dart
final result = await Navigator.push(...);
```
- `await` means "wait for this to finish"
- Navigation returns data when the screen is popped
- You can then use the returned data

---

## 🎯 Practice Exercises

### 🟢 Beginner Challenges

#### Challenge 1: Create a Profile Page
Create a new page that shows:
- A user's name
- Their favorite color
- A back button

**Hint:** Use the GiftPage as a template!

#### Challenge 2: Number Picker
Create a screen that:
- Shows numbers 1-10 as buttons
- Returns the selected number to the home page
- Shows the selected number in a SnackBar

**Hint:** Look at how RatingPage returns data!

---

### 🟡 Intermediate Challenges

#### Challenge 3: Animal Selector
Create a mini-app:
1. Home screen with 3 animal buttons (🐶 🐱 🐦)
2. Clicking an animal goes to a detail page showing:
   - Animal emoji (big!)
   - Animal name
   - Fun fact about the animal
   - Back button

**Bonus:** Add a "Random Animal" button that randomly picks one!

#### Challenge 4: Shopping Cart
Build a simple shopping list:
1. Home screen showing list of added items
2. "Add Item" button goes to new screen
3. New screen has:
   - Text field for item name
   - "Add" button that returns the item name
   - Cancel button
4. Display added items on home screen

**Hint:** You'll need StatefulWidget on the home screen!

---

### 🔴 Advanced Challenges

#### Challenge 5: Multi-Step Form
Create a 3-step registration form:
- Screen 1: Enter name
- Screen 2: Pick favorite color
- Screen 3: Summary showing all info
- From Screen 3, you can go back and edit

**Hint:** Pass data forward through screens and use `Navigator.popUntil()` for edits!

#### Challenge 6: Photo Gallery
Build an image gallery:
1. Home screen with grid of emoji "photos"
2. Tap an emoji to see it full screen
3. Full screen has:
   - Big emoji
   - Left/Right buttons to view other photos
   - Close button
4. Keep track of which photo you're viewing

**Super bonus:** Add a share button that returns "shared" to show a SnackBar!

---

## 🎪 Fun Mini-Project: Adventure Game

Create a "Choose Your Own Adventure" game:

1. **Start Screen:** You're at a crossroads
   - Button: Go Left → Forest
   - Button: Go Right → Cave

2. **Forest Screen:** You find a treasure chest
   - Button: Open it → Treasure screen (you win!)
   - Button: Leave → Back to start

3. **Cave Screen:** You meet a dragon
   - Button: Talk to dragon → Dragon becomes friend (you win!)
   - Button: Run away → Back to start

4. **Win Screen:** Shows victory message
   - Button: Play Again → Goes back to start

**Features to add:**
- Keep score of how many times you won
- Pass player name through screens
- Add more paths and choices
- Create different endings

---

## 💡 Pro Tips

### ✅ DO:
- Use meaningful names for your screens (HomePage, ProfilePage, etc.)
- Always provide data required by screens
- Handle back button presses gracefully
- Use `const` constructors when possible

### ❌ DON'T:
- Don't forget to check if widget is mounted before showing SnackBars after async navigation
- Don't create circular navigation (A → B → A → B...)
- Don't forget to pass required parameters
- Don't pop when you're already at the first screen

---

## 🐛 Common Mistakes & Fixes

### Mistake 1: Forgetting required parameters
```dart
// ❌ Error: senderName is required
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => GiftPage()),
);

// ✅ Correct
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => GiftPage(
      senderName: 'John',
      giftType: '🎁',
    ),
  ),
);
```

### Mistake 2: Using result before checking if mounted
```dart
// ❌ Might cause error
final result = await Navigator.push(...);
ScaffoldMessenger.of(context).showSnackBar(...);

// ✅ Safe
final result = await Navigator.push(...);
if (context.mounted) {
  ScaffoldMessenger.of(context).showSnackBar(...);
}
```

### Mistake 3: Trying to pop the first screen
```dart
// ❌ Nothing to pop!
Navigator.pop(context); // On the first screen

// ✅ Check first
if (Navigator.canPop(context)) {
  Navigator.pop(context);
}
```

---

## 🎓 Testing Your Understanding

Try to answer these questions:

1. What happens when you call `Navigator.push()`?
2. How do you send data to a new screen?
3. What does `await` do in navigation?
4. How do you go back multiple screens at once?
5. What's the difference between `pop()` and `popUntil()`?

<details>
<summary>Click to see answers</summary>

1. It adds a new screen on top of the navigation stack
2. Pass parameters to the screen's constructor
3. It waits for the screen to be popped and returns any data
4. Use `Navigator.popUntil(context, (route) => route.isFirst)`
5. `pop()` removes one screen, `popUntil()` removes screens until a condition is met

</details>

---

## 🎮 Quick Reference

```dart
// Go to new screen
Navigator.push(context, MaterialPageRoute(builder: (context) => NewPage()));

// Go back
Navigator.pop(context);

// Go back with data
Navigator.pop(context, myData);

// Go back to home
Navigator.popUntil(context, (route) => route.isFirst);

// Replace current screen
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewPage()));

// Get data back
final result = await Navigator.push(...);
```

---

## 📚 What's Next?

Now that you can navigate between screens, you're ready for:
- **Forms & Input**: Text fields, buttons, validation
- **Lists & ScrollViews**: Displaying lots of data
- **State Management**: Managing data across screens
- **Bottom Navigation**: Tab-based navigation

---

## 🎉 Achievement Unlocked!

Once you complete the practice exercises, you'll understand:
- ✅ How to move between screens
- ✅ How to pass data between screens
- ✅ How to handle user selections
- ✅ How to build multi-screen apps

**Keep building! The best way to learn is by creating your own projects!** 🚀

---

### 🔗 Resources
- [Flutter Navigation Docs](https://flutter.dev/docs/cookbook/navigation)
- [Navigator Class](https://api.flutter.dev/flutter/widgets/Navigator-class.html)
- [Routes and Navigation Guide](https://docs.flutter.dev/ui/navigation)