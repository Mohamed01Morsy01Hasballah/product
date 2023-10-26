import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:products/Modules/Home.dart';
import 'package:products/Modules/Setting.dart';
import 'package:products/Modules/category.dart';
import 'package:products/Network/Remote/DioHelper.dart';
import 'package:products/cubit/StatesProducts.dart';
import 'package:products/models/ProductModel.dart';
import 'package:products/models/UserData.dart';

import '../models/AddCourseModel.dart';
import '../models/GetCourseModel.dart';

class ProductCubit extends Cubit<ProductStates>{
  ProductCubit():super(initialState());
  static ProductCubit get(context)=>BlocProvider.of(context);
  var currentIndex=0;
  GetCourseModel? getCourseModel;

  void GetCourse(){
    emit(GetCourseLoadingState());
    DioHelper.getData(
      url: 'teacher/courses',
     // token: tokenTeacher,

      token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjgzMjAyMzU1LCJleHAiOjIwNDMyMDIzNTUsIm5iZiI6MTY4MzIwMjM1NSwianRpIjoiYXJDM2I2THd4M1d6WDRYdSIsInN1YiI6IjEiLCJwcnYiOiJiMjdiZWUyM2JhZjU0MjlmNWI5YTIxNjk2ZmRlMDNjMjc3MDQ0ZWE1In0.4IrmnPrLIGAv0ZbbUOQNI9mbPv7gdNo9sbojK0zZ_y4'
    ).then((value) {
      getCourseModel=GetCourseModel.fromJson(value.data);
      print(getCourseModel!.status);
      emit(GetCourseSuccessState());

    }).catchError((error){
      emit(GetCourseErrorState());
    });
  }
  AddCourseModel? addCourseModel;
  void AddCourse({
    required String name,
    required String desc,
    required String available,
    required File image
  }){
    emit(AddCourseErrorState());
    DioHelper.SendData(
        url: 'teacher/courses',

        token: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNjgzMjAyMzU1LCJleHAiOjIwNDMyMDIzNTUsIm5iZiI6MTY4MzIwMjM1NSwianRpIjoiYXJDM2I2THd4M1d6WDRYdSIsInN1YiI6IjEiLCJwcnYiOiJiMjdiZWUyM2JhZjU0MjlmNWI5YTIxNjk2ZmRlMDNjMjc3MDQ0ZWE1In0.4IrmnPrLIGAv0ZbbUOQNI9mbPv7gdNo9sbojK0zZ_y4'
       ,
        query: {
          'name':name,
          'description':desc,
          'for':available,
          'image':image
        }
    ).then((value){
      addCourseModel=AddCourseModel.fromJson(value.data);
      emit(AddCourseSuccessState(addCourseModel!));
      print(addCourseModel!.message);
    }).catchError((error){
      print('error add Course $error');
      emit(AddCourseErrorState());
    });
  }
  File? imageData;
  void getImage()async{
    final ImagePicker picker=ImagePicker();
    var image =await picker.pickImage(source: ImageSource.gallery);
    final imageTemporary=File(image!.path);
    imageData=imageTemporary;
    emit(ImageState());
  }
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
        query: {},
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
