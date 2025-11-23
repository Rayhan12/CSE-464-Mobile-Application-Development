import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list_app_2/screens/home_page.dart';
import 'package:task_list_app_2/services/task_management_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => TaskManagementService() ),
      ],

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: HomePage()
      ),
    );
  }
}

