
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/cubit/CubitProducts.dart';
import 'package:products/cubit/StatesProducts.dart';
import 'package:products/models/ProductModel.dart';

import '../Components.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener: (context,state){},
        builder: (context,state){
        var cubit=ProductCubit.get(context);
        return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ConditionalBuilder(
                  condition: state is! GetProductLoadingState,
                  builder: (context)=>ListView.separated(
                      itemBuilder: (context,index)=>BuiltItem(cubit.product[index],context),
                      separatorBuilder: (context,state)=>Container(
                        color: Colors.white,
                        height: 2,
                        width: double.infinity,
                      ),
                      itemCount: cubit.product.length
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator())
              )
            )
        );
        },

    );
  }

}