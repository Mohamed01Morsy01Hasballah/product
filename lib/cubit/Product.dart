import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/cubit/CubitProducts.dart';
import 'package:products/cubit/StatesProducts.dart';

class Product extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<ProductCubit,ProductStates>(
     listener: (context,state){},
     builder: (context,state){
       var cubit=ProductCubit.get(context);
       return Scaffold(
         appBar: AppBar(
           title: Text(
             '${cubit.title[cubit.currentIndex]}'
           ),
         ),
         bottomNavigationBar: BottomNavigationBar(
           type:BottomNavigationBarType.fixed,
           currentIndex: cubit.currentIndex,
           onTap: (index) {
             cubit.changeButtonNav(index);
           },
           items: [
             BottomNavigationBarItem(
                 icon: Icon(
                     Icons.home
                 ),
                 label: ' Home'
             ),
             BottomNavigationBarItem(
                 icon: Icon(
                     Icons.apps
                 ),
                 label: ' category'
             ),
             BottomNavigationBarItem(
                 icon: Icon(
                     Icons.settings
                 ),
                 label: ' Settings'
             ),

           ],
         ),
         body:cubit.screen[cubit.currentIndex] ,
       );
     },

   );
  }

}