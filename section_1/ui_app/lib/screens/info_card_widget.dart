import 'package:flutter/material.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath =
        'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1170';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(20),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "This is Headline",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text(
            "This is the body text.It should be in 2 lines. New screen for uStock, it's profile & community screens!",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(imagePath, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(imagePath, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.network(imagePath, fit: BoxFit.cover),
                  ),
                ],
              ),

              // Spacer(),
              TextButton(
                onPressed: (){},
                
                child: Text("See More",style: TextStyle(fontSize: 16),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
