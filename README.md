# 🎨 UI Design & Material Design - Making Beautiful Apps

<div align="center">

![UI Design](https://img.shields.io/badge/UI-Design-FF6B6B?style=for-the-badge)
![Material Design](https://img.shields.io/badge/Material-Design-757575?style=for-the-badge&logo=material-design&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

**Where Function Meets Beauty! ✨**

*Transform your apps from functional to fabulous! 🚀*

</div>

---

## 🎯 What You'll Learn in This Branch

This branch focuses on creating stunning user interfaces:

- 🎨 **Material Design**: Google's design system
- 🎭 **Custom Widgets**: Building reusable components
- 🌈 **Theming**: Consistent color schemes and typography
- 📱 **Responsive Design**: Adapting to different screen sizes

---

## 📚 Lecture Notes

### 1. Essential Flutter Widgets 🧩

Flutter widgets are the building blocks of your app's UI. Here are the most commonly used widgets with practical examples:

#### Layout Widgets 📐

**Container** - The most versatile widget for styling and positioning:
```dart
Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.symmetric(vertical: 8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 2,
        blurRadius: 5,
      ),
    ],
  ),
  child: Text('Hello Container!'),
)
```

**Row & Column** - For horizontal and vertical layouts:
```dart
// Horizontal layout
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.star),
    Text('Rating: 4.5'),
    ElevatedButton(onPressed: () {}, child: Text('Rate')),
  ],
)

// Vertical layout
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Title', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    Text('Subtitle', style: TextStyle(fontSize: 16, color: Colors.grey)),
    SizedBox(height: 16),
    Text('Description...'),
  ],
)
```

**SizedBox** - For spacing and sizing:
```dart
SizedBox(
  width: 20,
  height: 50,
  child: Container(color: Colors.red),
)

// For spacing between widgets
Column(
  children: [
    Text('First widget'),
    SizedBox(height: 16), // 16px spacing
    Text('Second widget'),
  ],
)
```

**Expanded & Flexible** - For responsive layouts:
```dart
Row(
  children: [
    Expanded(
      flex: 2, // Takes 2/3 of available space
      child: Container(color: Colors.blue, child: Text('Flex 2')),
    ),
    Expanded(
      flex: 1, // Takes 1/3 of available space
      child: Container(color: Colors.red, child: Text('Flex 1')),
    ),
  ],
)
```

#### Display Widgets 📱

**Text Widget** - For displaying text:
```dart
Text(
  'Hello Flutter!',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    letterSpacing: 1.2,
  ),
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

**RichText** - For styled text with multiple formats:
```dart
RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 16, color: Colors.black),
    children: [
      TextSpan(text: 'Hello '),
      TextSpan(
        text: 'Flutter',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      TextSpan(text: '!'),
    ],
  ),
)
```

**Image Widget** - For displaying images:
```dart
// Network image
Image.network(
  'https://example.com/image.jpg',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  errorBuilder: (context, error, stackTrace) {
    return Icon(Icons.error, size: 50);
  },
)

// Asset image
Image.asset(
  'assets/images/logo.png',
  width: 100,
  height: 100,
)

// Circular image
CircleAvatar(
  radius: 50,
  backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
  child: Text('A'), // Fallback if image fails
)
```

**Icon Widget** - For displaying icons:
```dart
Icon(
  Icons.favorite,
  size: 30,
  color: Colors.red,
)

// Icon with different styles
IconButton(
  icon: Icon(Icons.settings),
  onPressed: () {
    print('Settings tapped!');
  },
  tooltip: 'Settings',
)
```

#### Input Widgets ⌨️

**TextField** - For text input:
```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Enter your name',
    hintText: 'John Doe',
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    filled: true,
    fillColor: Colors.grey[100],
  ),
  keyboardType: TextInputType.text,
  maxLength: 50,
  onChanged: (value) {
    print('Text changed: $value');
  },
)
```

**Buttons** - Various button types:
```dart
// Elevated Button
ElevatedButton(
  onPressed: () {
    print('Button pressed!');
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
  child: Text('Click Me'),
)

// Outlined Button
OutlinedButton(
  onPressed: () {},
  child: Text('Outlined Button'),
)

// Text Button
TextButton(
  onPressed: () {},
  child: Text('Text Button'),
)

// Icon Button
IconButton(
  onPressed: () {},
  icon: Icon(Icons.favorite),
  tooltip: 'Add to favorites',
)
```

**Checkbox & Switch** - For boolean inputs:
```dart
// Checkbox
CheckboxListTile(
  title: Text('Enable notifications'),
  subtitle: Text('Receive push notifications'),
  value: isNotificationEnabled,
  onChanged: (bool? value) {
    setState(() {
      isNotificationEnabled = value ?? false;
    });
  },
)

// Switch
SwitchListTile(
  title: Text('Dark Mode'),
  subtitle: Text('Switch to dark theme'),
  value: isDarkMode,
  onChanged: (bool value) {
    setState(() {
      isDarkMode = value;
    });
  },
)
```

#### Navigation Widgets 🧭

**AppBar** - Top navigation bar:
```dart
AppBar(
  title: Text('My App'),
  backgroundColor: Colors.blue,
  elevation: 4,
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ],
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {},
  ),
)
```

**BottomNavigationBar** - Bottom navigation:
```dart
BottomNavigationBar(
  currentIndex: selectedIndex,
  onTap: (index) {
    setState(() {
      selectedIndex = index;
    });
  },
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ],
)
```

**Drawer** - Side navigation menu:
```dart
Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(color: Colors.blue),
        child: Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Home'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () {},
      ),
    ],
  ),
)
```

#### List Widgets 📋

**ListView** - For scrollable lists:
```dart
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(items[index][0]),
      ),
      title: Text(items[index]),
      subtitle: Text('Subtitle for ${items[index]}'),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        print('Tapped on ${items[index]}');
      },
    );
  },
)
```

**GridView** - For grid layouts:
```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  ),
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.star, size: 50),
          Text(items[index]),
        ],
      ),
    );
  },
)
```

#### Card & Container Widgets 🎴

**Card** - Material Design card:
```dart
Card(
  elevation: 4,
  margin: EdgeInsets.all(8),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card Title',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text('Card content goes here...'),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(onPressed: () {}, child: Text('Cancel')),
            ElevatedButton(onPressed: () {}, child: Text('OK')),
          ],
        ),
      ],
    ),
  ),
)
```

**AlertDialog** - For popup dialogs:
```dart
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Confirm Action'),
      content: Text('Are you sure you want to proceed?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Perform action
            Navigator.of(context).pop();
          },
          child: Text('Confirm'),
        ),
      ],
    );
  },
);
```

### 2. Material Design Principles 🎨

Material Design is Google's design system that helps create beautiful, functional user experiences.

#### Key Principles:
- **Material is the metaphor**: Digital surfaces that behave like physical materials
- **Bold, graphic, intentional**: Clear hierarchy and meaningful design
- **Motion provides meaning**: Visual feedback that guides user attention

### 3. Custom Widgets 🧩

Create reusable widgets to maintain consistency across your app.

```dart
class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
```

### 4. Theming & Colors 🌈

Create consistent visual identity with themes.

```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16),
    ),
  ),
  home: MyHomePage(),
)
```

---

## 💻 Hands-On Projects

### Project 1: Beautiful Profile Screen 👤
**Difficulty**: ⭐⭐  
**Time**: 45 minutes

Create a stunning profile screen with Material Design components.

**Requirements**:
- Profile picture with circular border
- User information in a clean layout
- Action buttons (Edit Profile, Settings, etc.)
- Use Material Design colors and typography

### Project 2: Interactive Dashboard 📊
**Difficulty**: ⭐⭐⭐  
**Time**: 1.5 hours

Build a dashboard with interactive cards and smooth interactions.

**Requirements**:
- Grid of interactive cards
- Each card shows different metrics
- Smooth tap interactions
- Responsive layout

---

## 🎯 Key Takeaways

After completing this branch, you should understand:

1. **Material Design**: Google's design principles and components
2. **Custom Widgets**: Creating reusable UI components
3. **Theming**: Consistent visual identity across apps
4. **Responsive Design**: Adapting to different screen sizes

---

<div align="center">

**Design Beautifully! 🎨**

*Great design is not just how it looks, but how it works!*

</div>
