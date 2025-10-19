import 'package:flutter/material.dart';
import 'package:ui_app/screens/info_card_widget.dart';
import 'package:ui_app/widgets/custom_search_widget.dart';

class ListDataViewScreen extends StatefulWidget {
  const ListDataViewScreen({super.key});

  @override
  State<ListDataViewScreen> createState() => _ListDataViewScreenState();
}

class _ListDataViewScreenState extends State<ListDataViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community',style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
              
            children: [
              SizedBox(height: 20,),
              Text("Learn Stock,\nEducate The WORLD",textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),),
              SizedBox(height: 15,),
              CustomSearchWidget(),
              SizedBox(height: 15,),
              InfoCardWidget()
            ],
          ),
        ),
      ),
    

    );
  }
}