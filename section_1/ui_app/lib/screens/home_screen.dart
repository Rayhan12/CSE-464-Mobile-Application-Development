import 'package:flutter/material.dart';
import 'package:ui_app/screens/list_data_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.yellow),
      
      drawer: Drawer(
        child: Center(child: Text('This is Drawer')),
      ),
      
      
      body: SizedBox(
        width: MediaQuery.of(context).size.width,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SCREEN WIDTH: ${MediaQuery.of(context).size.width}",
              style: TextStyle(fontSize: 30),
            ),
            Text("Go to List View Screen", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20,),
            ElevatedButton.icon(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ListDataViewScreen()));
              },
              icon: Icon(Icons.arrow_circle_right_rounded,size: 30,),
              label: Text("Go to List View Screen",style: TextStyle(fontSize: 25),),
            )
          ],
        ),
      ),
    );
  }
}
