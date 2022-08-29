
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget{
  String? title;
  dynamic price;
  String? image;
  String? category;
  String? description;

  DetailsScreen({
    required this.title,
    required this.category,
    required this.price,
    required this.image,
    required this.description

  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details Product'
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
                width: double.infinity,
                child: Image(image: NetworkImage('${image}'))
            ),
            SizedBox(height: 40,),
            Text(
              'Title :${title} ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.4

              ),
            ),
            SizedBox(height: 20,),
            Text(
              'Price :${price} ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green

              ),
            ),
            SizedBox(height: 20,),

            Text(
              'Category :${category}',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.red

              ),
            ),
            SizedBox(height: 15,),

            Text(
              'description  :${description}',
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  height: 1.5,
                  color: Colors.orange

              ),
            ),




          ],
        ),
      ),
    );
  }

}