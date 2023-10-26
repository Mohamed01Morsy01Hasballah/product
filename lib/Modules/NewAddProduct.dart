import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/cubit/CubitProducts.dart';
import 'package:products/cubit/StatesProducts.dart';

class AddProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<ProductCubit,ProductStates>
     (
    listener: (context,state){},
    builder: (context,state){
      var cubit=ProductCubit.get(context);
      return Scaffold(
      appBar: AppBar(
      title: Text('Product New '),
      ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 250,
                  width: double.infinity,
                child: Image.file(
                  File(cubit.productNew['image']),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 40,),
              Text(
                'Title :${cubit.productNew['title']} ',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.4

                ),
              ),
              SizedBox(height: 20,),
              Text(
                'Price :${cubit.productNew['price']} ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green

                ),
              ),
              SizedBox(height: 20,),

              Text(
                'Category :${cubit.productNew['category']}',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.red

                ),
              ),
              SizedBox(height: 15,),

              Text(
                'description  :${cubit.productNew['description']}',
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
    },
   );
  }

}