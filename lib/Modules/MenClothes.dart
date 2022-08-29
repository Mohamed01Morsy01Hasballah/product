import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/cubit/CubitProducts.dart';
import 'package:products/cubit/StatesProducts.dart';

import '../Components.dart';
import '../models/ProductModel.dart';

class MenClothes extends StatelessWidget{
  String? text;
  MenClothes({required this.text});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ProductCubit()..GetProductCategory(text!),
      child: BlocConsumer<ProductCubit,ProductStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=ProductCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('${text}'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ConditionalBuilder(
                    condition: state is! GetProductLoadingState,
                    builder: (context)=> ListView.separated(
                        itemBuilder: (context,index)=>BuiltItem(cubit.PtCategory[index],context),
                        separatorBuilder: (context,state)=>Container(
                          color: Colors.white,
                          height: 2,
                          width: double.infinity,
                        ),
                        itemCount: cubit.PtCategory.length
                    ),
                    fallback: (context)=>Center(child: CircularProgressIndicator()))
              )
          );
        },
      ),
    );
  }


}