# 🔄 State Management with Provider & API Integration with Dio

<div align="center">

![State Management](https://img.shields.io/badge/State-Management-FF6B6B?style=for-the-badge)
![Provider](https://img.shields.io/badge/Provider-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dio](https://img.shields.io/badge/Dio-API-4ECDC4?style=for-the-badge)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

**Managing State Like a Pro! 🚀**

*From local state to global state, and connecting to the world! 🌐*

</div>

---

## 🎯 What You'll Learn in This Branch

This branch focuses on medium-level state management and API integration:

- 🔄 **Provider Pattern**: Managing app-wide state efficiently
- 🌐 **Dio HTTP Client**: Making API calls like a pro
- 📡 **API Integration**: Connecting your app to backend services
- 🎯 **State Management Best Practices**: When and how to use different approaches
- 🔐 **Error Handling**: Gracefully handling network errors and edge cases
- ⚡ **Loading States**: Creating smooth user experiences

---

## 📚 Lecture Notes

### 1. Understanding State Management 🧠

State management is about managing the data that changes over time in your app. Think of it as the memory of your application!

#### Why Do We Need State Management?

- **Local State**: State that belongs to a single widget (use `setState`)
- **App-Wide State**: State shared across multiple widgets (use Provider, Riverpod, Bloc, etc.)
- **Complex State**: When state logic becomes too complex for `setState`

#### When to Use Provider?

✅ **Use Provider when:**
- Multiple widgets need the same data
- You want to separate business logic from UI
- You need to share state across different screens
- You want testable and maintainable code

❌ **Don't use Provider when:**
- State is only needed in one widget (use `setState`)
- The state is very simple and temporary

---

### 2. Provider Package Setup 🛠️

First, add the necessary dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  dio: ^5.4.0
  json_annotation: ^4.8.1

dev_dependencies:
  json_serializable: ^6.7.1
  build_runner: ^2.4.7
```

Then run:
```bash
flutter pub get
```

---

### 3. Provider Basics 🔄

#### Creating a Simple Provider

**Step 1: Create a Model/State Class**

```dart
// models/counter_model.dart
import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;
  
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners(); // Notify all listeners about the change
  }
  
  void decrement() {
    _count--;
    notifyListeners();
  }
  
  void reset() {
    _count = 0;
    notifyListeners();
  }
}
```

**Step 2: Provide the Model at App Level**

```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/counter_model.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        title: 'Provider Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
```

**Step 3: Consume the Provider in Widgets**

```dart
// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Using Consumer - rebuilds only when data changes
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                return Text(
                  'Count: ${counter.count}',
                  style: TextStyle(fontSize: 48),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterModel>(context, listen: false)
                        .decrement();
                  },
                  child: Text('-'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CounterModel>(context, listen: false)
                        .increment();
                  },
                  child: Text('+'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<CounterModel>(context, listen: false).reset();
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
```

#### Different Ways to Access Provider

```dart
// Method 1: Using Provider.of (with listen: false for actions)
Provider.of<CounterModel>(context, listen: false).increment();

// Method 2: Using Consumer (rebuilds when data changes)
Consumer<CounterModel>(
  builder: (context, counter, child) {
    return Text('${counter.count}');
  },
)

// Method 3: Using context.watch (rebuilds when data changes)
final counter = context.watch<CounterModel>();
Text('${counter.count}')

// Method 4: Using context.read (doesn't rebuild, for actions)
context.read<CounterModel>().increment();
```

---

### 4. Multiple Providers & Provider Types 🎭

#### Using Multiple Providers

```dart
// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/counter_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: themeProvider.isDarkMode 
                ? ThemeData.dark() 
                : ThemeData.light(),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
```

#### Different Provider Types

```dart
// 1. ChangeNotifierProvider - For classes that extend ChangeNotifier
ChangeNotifierProvider(create: (_) => MyModel())

// 2. Provider - For immutable data (doesn't change)
Provider<String>(create: (_) => 'Hello World')

// 3. FutureProvider - For async data that loads once
FutureProvider<List<User>>(
  create: (_) => fetchUsers(),
  initialData: [],
)

// 4. StreamProvider - For real-time data streams
StreamProvider<Location>(
  create: (_) => locationStream(),
  initialData: Location.initial(),
)
```

---

### 5. Dio HTTP Client Setup 🌐

Dio is a powerful HTTP client for Dart/Flutter with interceptors, global configuration, and more.

#### Basic Dio Setup

```dart
// services/api_service.dart
import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;
  
  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com',
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    
    // Add interceptors for logging
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }
  
  // GET request
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }
  
  // POST request
  Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }
  
  // PUT request
  Future<Response> put(String path, {dynamic data}) {
    return _dio.put(path, data: data);
  }
  
  // DELETE request
  Future<Response> delete(String path) {
    return _dio.delete(path);
  }
}
```

#### Creating Models for API Responses

```dart
// models/user_model.dart
class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;
  
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.website,
  });
  
  // From JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }
  
  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'website': website,
    };
  }
}
```

---

### 6. Combining Provider with Dio 🔗

#### Creating a Provider with API Calls

```dart
// providers/user_provider.dart
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

enum UserState { initial, loading, loaded, error }

class UserProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  UserState _state = UserState.initial;
  List<User> _users = [];
  String? _errorMessage;
  
  UserState get state => _state;
  List<User> get users => _users;
  String? get errorMessage => _errorMessage;
  
  // Fetch all users
  Future<void> fetchUsers() async {
    _state = UserState.loading;
    _errorMessage = null;
    notifyListeners();
    
    try {
      final response = await _apiService.get('/users');
      
      if (response.statusCode == 200) {
        _users = (response.data as List)
            .map((json) => User.fromJson(json))
            .toList();
        _state = UserState.loaded;
      } else {
        _errorMessage = 'Failed to load users';
        _state = UserState.error;
      }
    } on DioException catch (e) {
      _errorMessage = _handleDioError(e);
      _state = UserState.error;
    } catch (e) {
      _errorMessage = 'An unexpected error occurred: $e';
      _state = UserState.error;
    }
    
    notifyListeners();
  }
  
  // Fetch single user
  Future<User?> fetchUser(int id) async {
    try {
      final response = await _apiService.get('/users/$id');
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
      return null;
    } on DioException catch (e) {
      _errorMessage = _handleDioError(e);
      notifyListeners();
      return null;
    }
  }
  
  // Create new user
  Future<bool> createUser(User user) async {
    try {
      final response = await _apiService.post('/users', data: user.toJson());
      if (response.statusCode == 201) {
        _users.add(User.fromJson(response.data));
        notifyListeners();
        return true;
      }
      return false;
    } on DioException catch (e) {
      _errorMessage = _handleDioError(e);
      notifyListeners();
      return false;
    }
  }
  
  // Update user
  Future<bool> updateUser(User user) async {
    try {
      final response = await _apiService.put('/users/${user.id}', data: user.toJson());
      if (response.statusCode == 200) {
        final index = _users.indexWhere((u) => u.id == user.id);
        if (index != -1) {
          _users[index] = user;
          notifyListeners();
        }
        return true;
      }
      return false;
    } on DioException catch (e) {
      _errorMessage = _handleDioError(e);
      notifyListeners();
      return false;
    }
  }
  
  // Delete user
  Future<bool> deleteUser(int id) async {
    try {
      final response = await _apiService.delete('/users/$id');
      if (response.statusCode == 200) {
        _users.removeWhere((user) => user.id == id);
        notifyListeners();
        return true;
      }
      return false;
    } on DioException catch (e) {
      _errorMessage = _handleDioError(e);
      notifyListeners();
      return false;
    }
  }
  
  // Error handling helper
  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet.';
      case DioExceptionType.badResponse:
        return 'Server error: ${error.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.unknown:
        return 'No internet connection';
      default:
        return 'An error occurred: ${error.message}';
    }
  }
}
```

#### Using the Provider in UI

```dart
// screens/users_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../models/user_model.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch users when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().fetchUsers();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              context.read<UserProvider>().fetchUsers();
            },
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          // Show loading indicator
          if (userProvider.state == UserState.loading) {
            return Center(child: CircularProgressIndicator());
          }
          
          // Show error message
          if (userProvider.state == UserState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    userProvider.errorMessage ?? 'An error occurred',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      userProvider.fetchUsers();
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }
          
          // Show users list
          if (userProvider.users.isEmpty) {
            return Center(child: Text('No users found'));
          }
          
          return RefreshIndicator(
            onRefresh: () => userProvider.fetchUsers(),
            child: ListView.builder(
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) {
                final user = userProvider.users[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(user.name[0]),
                  ),
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Delete User'),
                          content: Text('Are you sure you want to delete ${user.name}?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text('Delete'),
                            ),
                          ],
                        ),
                      );
                      
                      if (confirmed == true) {
                        await userProvider.deleteUser(user.id);
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User deleted')),
                          );
                        }
                      }
                    },
                  ),
                  onTap: () {
                    // Navigate to user details
                  },
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add user screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

---

### 7. Advanced Dio Features 🚀

#### Adding Request Interceptors (Authentication)

```dart
// services/api_service.dart
class ApiService {
  late Dio _dio;
  String? _token;
  
  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    ));
    
    // Add auth interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add token to headers
          if (_token != null) {
            options.headers['Authorization'] = 'Bearer $_token';
          }
          return handler.next(options);
        },
        onError: (error, handler) {
          // Handle 401 unauthorized
          if (error.response?.statusCode == 401) {
            // Refresh token or logout
            _token = null;
          }
          return handler.next(error);
        },
      ),
    );
  }
  
  void setToken(String token) {
    _token = token;
  }
}
```

#### Error Handling with Dio

```dart
// utils/error_handler.dart
import 'package:dio/dio.dart';

class ErrorHandler {
  static String getErrorMessage(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please check your connection.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Server is taking too long.';
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        switch (statusCode) {
          case 400:
            return 'Bad request. Please check your input.';
          case 401:
            return 'Unauthorized. Please login again.';
          case 403:
            return 'Forbidden. You don\'t have permission.';
          case 404:
            return 'Not found. The resource doesn\'t exist.';
          case 500:
            return 'Server error. Please try again later.';
          default:
            return 'Error: $statusCode';
        }
      case DioExceptionType.cancel:
        return 'Request cancelled.';
      case DioExceptionType.unknown:
        return 'No internet connection. Please check your network.';
      default:
        return 'An unexpected error occurred.';
    }
  }
}
```

---

### 8. Best Practices & Patterns 📋

#### 1. Separate Concerns

```dart
// ✅ Good: Separate API service, model, and provider
services/
  api_service.dart
models/
  user_model.dart
providers/
  user_provider.dart

// ❌ Bad: Everything in one file
```

#### 2. Use Enums for State

```dart
// ✅ Good
enum DataState { initial, loading, loaded, error }

// ❌ Bad
bool isLoading = false;
bool hasError = false;
bool isLoaded = false;
```

#### 3. Handle Loading and Error States

```dart
// ✅ Good
if (state == DataState.loading) return LoadingWidget();
if (state == DataState.error) return ErrorWidget(message);

// ❌ Bad
if (users.isEmpty) return Text('No data'); // What if still loading?
```

#### 4. Use context.read for Actions

```dart
// ✅ Good - doesn't rebuild
onPressed: () => context.read<UserProvider>().fetchUsers()

// ❌ Bad - causes unnecessary rebuilds
onPressed: () => context.watch<UserProvider>().fetchUsers()
```

#### 5. Dispose Resources Properly

```dart
class MyProvider extends ChangeNotifier {
  Timer? _timer;
  
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
```

---

## 🌐 Practice API Resources

Here are some free APIs you can use to practice Provider and Dio integration:

### JSONPlaceholder - Fake REST API 🎯
**Base URL**: `https://jsonplaceholder.typicode.com`

Perfect for learning CRUD operations:
- **Users**: `/users` - Get, create, update, delete users
- **Posts**: `/posts` - Blog posts with user relationships
- **Comments**: `/comments` - Comments on posts
- **Albums**: `/albums` - Photo albums
- **Photos**: `/photos` - Images
- **Todos**: `/todos` - Todo items

**Example Endpoints**:
- `GET /users` - Get all users
- `GET /users/1` - Get user by ID
- `POST /users` - Create new user
- `PUT /users/1` - Update user
- `DELETE /users/1` - Delete user

### ReqRes - REST API for Testing 📡
**Base URL**: `https://reqres.in/api`

Great for authentication and pagination:
- **Users**: `/users` - User list with pagination
- **Single User**: `/users/:id` - Get user details
- **Login**: `/login` - Authentication endpoint
- **Register**: `/register` - User registration

**Example Endpoints**:
- `GET /users?page=1` - Get users with pagination
- `GET /users/2` - Get single user
- `POST /login` - Login with email and password
- `POST /users` - Create new user

### Dog API - Random Dog Images 🐕
**Base URL**: `https://dog.ceo/api`

Simple API for practicing image loading:
- **Random Dog**: `/breeds/image/random` - Get random dog image
- **All Breeds**: `/breeds/list/all` - List all dog breeds
- **Breed Images**: `/breed/:breed/images` - Get images by breed

### Cat Facts API 🐱
**Base URL**: `https://catfact.ninja`

Simple GET requests:
- **Random Fact**: `/fact` - Get random cat fact
- **Facts List**: `/facts?limit=10` - Get multiple facts

### OpenWeatherMap API 🌤️
**Base URL**: `https://api.openweathermap.org/data/2.5`

**Note**: Requires free API key from [openweathermap.org](https://openweathermap.org/api)

- **Current Weather**: `/weather?q={city}&appid={key}` - Get weather by city
- **Forecast**: `/forecast?q={city}&appid={key}` - Get 5-day forecast

### REST Countries API 🌍
**Base URL**: `https://restcountries.com/v3.1`

Country information API:
- **All Countries**: `/all` - Get all countries
- **By Name**: `/name/{name}` - Search by country name
- **By Capital**: `/capital/{capital}` - Search by capital city
- **By Region**: `/region/{region}` - Get countries by region



### Tips for Practice 💡

1. **Start Simple**: Begin with JSONPlaceholder - it's the easiest
2. **Practice CRUD**: Try all operations (Create, Read, Update, Delete)
3. **Handle Errors**: Test with invalid IDs, network errors, etc.
4. **Add Loading States**: Show spinners while data loads
5. **Implement Refresh**: Add pull-to-refresh functionality
6. **Error Messages**: Display user-friendly error messages

---

## 🎯 Key Takeaways

After completing this branch, you should understand:

1. **Provider Pattern**: How to manage app-wide state efficiently
2. **Dio HTTP Client**: Making API calls with proper error handling
3. **State Management**: When to use Provider vs setState
4. **API Integration**: Connecting Flutter apps to backend services
5. **Error Handling**: Gracefully handling network errors
6. **Loading States**: Creating smooth user experiences
7. **Best Practices**: Writing maintainable and testable code

---

## 📚 Additional Resources

- [Provider Package Documentation](https://pub.dev/packages/provider)
- [Dio Package Documentation](https://pub.dev/packages/dio)
- [Flutter State Management Guide](https://docs.flutter.dev/development/data-and-backend/state-mgmt)
- [REST API Tutorial](https://restfulapi.net/)

---

<div align="center">

**Manage State Like a Pro! 🔄**

*Great apps are built on great state management!*

</div>
