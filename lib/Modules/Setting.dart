
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/cubit/CubitProducts.dart';

import '../Components.dart';
import '../cubit/StatesProducts.dart';
import 'NewAddProduct.dart';
//https://i.pravatar.cc
class SettingScreen extends StatelessWidget{
var image=TextEditingController();
var category=TextEditingController();
var name=TextEditingController();
var price=TextEditingController();
var description=TextEditingController();

var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener: (context,state){
        if(state is AddSuccessState){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
        }
      },
      builder: (context,state){
        var cubit=ProductCubit.get(context);
        return Scaffold(
          body:  Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Text(
                        'Add Product',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      BuiltTextField(
                          type: TextInputType.name,
                          controller: name,
                          label: 'Title',
                          prefix: Icons.person,
                          validate: (String? value){
                            if(value!.isEmpty){
                              return 'Please Enter Title ';
                            }
                            return null;

                          }
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      BuiltTextField(
                          type: TextInputType.text,
                          controller: description,
                          label: 'Description',
                          validate: (String? value){
                            if(value!.isEmpty){
                              return 'Please Enter Description';
                            }
                            return null;

                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      BuiltTextField(
                          type: TextInputType.number,
                          controller: price,
                          label: 'price',

                          validate: (String? value){
                            if(value!.isEmpty){
                              return 'Please Enter price';
                            }
                            return null;

                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        padding: EdgeInsets.all(8),
                        onPressed: (){
                          cubit.getImage();
                        },
                        color: Colors.black,
                        child: Text('Get Image',
                          style: TextStyle(
                              color: Colors.white
                          ),),
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                      ),
                      cubit.imageData ==null?
                      Container(
                        margin: EdgeInsets.all(1),
                        height: 15,
                        child: Text('Please Upload Image'),
                      ):CircleAvatar(
                        radius: 40,
                        backgroundImage: FileImage(cubit.imageData!),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BuiltTextField(
                          type: TextInputType.text,
                          controller: category,
                          label: 'category',
                          validate: (String? value){
                            if(value!.isEmpty){
                              return 'Please Enter category ';
                            }
                            return null;

                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      BuiltButton(height: 50, color: Colors.deepOrange, text: 'Add', function: (){
                        cubit.AddProduct(
                            title: name.text,
                            price: price.text,
                            desc: description.text,
                            image: cubit.imageData!.path,
                            category: category.text
                        );
                      }),
                      SizedBox(
                        height: 20,
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }

}