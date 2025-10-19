import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(40),
        borderRadius: BorderRadius.circular(10),
        border:Border.all(
          width: 1,
          color: Colors.grey
        )
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search,size: 35,),
          Text('Search Somthing..',style: TextStyle(fontSize: 17,),)
        ],
      ),

    );
  }
}