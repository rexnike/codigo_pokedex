import 'package:flutter/material.dart';

class ItemDataWidget extends StatelessWidget {
  
  String title;
  String data;
  ItemDataWidget({
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
                  children: [
                    Text("$title: ", 
                    style: TextStyle(
                    color: Colors.black,
                        ),
                      ),
                    Text(data),
                      ],
                    ),
    );
  }
}