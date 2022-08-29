import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Modules/Electronic.dart';
import 'package:products/Modules/Jewelery.dart';
import 'package:products/Modules/MenClothes.dart';
import 'package:products/Modules/WomenClothes.dart';
import 'package:products/cubit/CubitProducts.dart';
import 'package:products/cubit/StatesProducts.dart';
class CategoryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ProductCubit.get(context);
        return Scaffold(
          body: ListView.separated(
              itemBuilder: (context,index)=>BuiltItems(cubit.category[index],context),
              separatorBuilder: (context,state)=>Container(
                color: Colors.grey[300],
                height: 2,
                width: double.infinity,
              ),
              itemCount: cubit.category.length
          )
        );
      },

    );
  }
  Widget BuiltItems(model,context){

    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Electronic(text: model[0],)));
              },
              child: Container(
                height: 80,
                width: double.infinity,

                child: Card(
                  elevation: 10,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '${model[0]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Jewelery(text: model[1],)));

              },
              child: Container(
                height: 80,
                width: double.infinity,

                child: Card(
                  elevation: 10,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '${model[1]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MenClothes(text: model[2],)));

              },
              child: Container(
                height: 80,
                width: double.infinity,

                child: Card(
                  elevation: 10,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '${model[2]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>WomenClothes(text: model[3],)));

              },
              child: Container(
                height: 80,
                width: double.infinity,

                child: Card(
                  elevation: 10,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '${model[3]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.green
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 70,)
          ],
        ),
      ),
    );
  }

}