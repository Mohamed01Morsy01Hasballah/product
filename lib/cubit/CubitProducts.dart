import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Modules/Home.dart';
import 'package:products/Modules/Setting.dart';
import 'package:products/Modules/category.dart';
import 'package:products/Network/Remote/DioHelper.dart';
import 'package:products/cubit/StatesProducts.dart';
import 'package:products/models/ProductModel.dart';
import 'package:products/models/UserData.dart';

class ProductCubit extends Cubit<ProductStates>{
  ProductCubit():super(initialState());
  static ProductCubit get(context)=>BlocProvider.of(context);
  var currentIndex=0;
  void changeButtonNav(int index){
    currentIndex=index;
    emit(changeButtonNavState());
  }
  bool secure=true;
  void changeIcon(){
    secure=!secure;
    emit(RegisterchangeIconState());
  }
  List<Widget> screen=[
    HomeScreen(),
    CategoryScreen(),
    SettingScreen()
  ];
  List<String> title=
  [
    'Home',
    'Category',
    'Setting'
  ];
  ProductModel? model;
  List<dynamic> product=[];
  void GetProduct(){
    emit(GetProductLoadingState());
    DioHelper.getData(
        url: 'products',
    ).then((value) {
    value.data.forEach((element){
     // print(value.data);
      model=ProductModel.fromJson(element);
      product.add(model);
    });
      emit(GetProductSuccessState());

    }).catchError((error){
      print("error ${error.toString()}");
      emit(GetProductSuccessState());

    });
  }

  List<dynamic> category=[];

  void GetGategory(){
   // emit(GetProductLoadingState());
    DioHelper.getData(
      url: 'products/categories',
    ).then((value) {

        category.add(value.data);
        print(value.data);
      emit(GetCategorySuccessState());

    }).catchError((error){
      print("error ${error.toString()}");
      emit(GetCategoryErrorState());

    });
  }
  List<dynamic> PtCategory=[];

  void GetProductCategory(String text){
    emit(GetProductLoadingState());
    DioHelper.getData(
      url: 'products/category/$text',
    ).then((value) {
      value.data.forEach((element){
        // print(value.data);
        model=ProductModel.fromJson(element);
        PtCategory.add(model);
      });
      emit(GetProductSuccessState());

    }).catchError((error){
      print("error ${error.toString()}");
      emit(GetProductSuccessState());

    });
  }
  Map<String,dynamic> productNew={};
  void AddProduct({
  required String title,
  required dynamic price,
  required String desc,
  required String image,
  required String category,

  }){
    emit(AddLoadingState());
    DioHelper.SendData(
        url: 'products',
        data: {
          'title':title,
          'price':price,
          'description':desc,
          'image':image,
          'category':category
        }
    ).then((value) {
      productNew.addAll(value.data);
      print(productNew['image']);

      emit(AddSuccessState());
      print('Success');
      GetProduct();
    }).catchError((error){
      print('error ${error.toString()}');
      emit(AddErrorState());

    });

}



}
