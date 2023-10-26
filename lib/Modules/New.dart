
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/cubit/StatesProducts.dart';

import '../Components.dart';
import '../cubit/CubitProducts.dart';
import '../models/GetCourseModel.dart';


class CourseScreen extends StatelessWidget {
  var name=TextEditingController();
  var desc=TextEditingController();
  var available=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ProductCubit(),
      child: BlocConsumer<ProductCubit,ProductStates>(
        listener: (context,state){
          if(state is AddCourseSuccessState){
            if(state.model.status=="success") {
              print('success');
            }else{

            }
          }
          else if(state is AddCourseErrorState){

          }

/*
          if(state is AddExamSucessState){
            if(state.model.status=='success'){
              QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: state.model.message,
              );


            }else {
              QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: state.model.message,
              );
            }
          }
          if(state is AddExamErrorState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'error Invalid',
            );
          }

          if(state is DeleteExamSuccessState){
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Delete Exam Successful',
            );

          }
          if(state is DeleteExamErrorState){
            QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'error Invalid'
            );

          }


 */

        },
        builder: (context,state){
          var cubit=ProductCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Courses'),
              ),
              body: ConditionalBuilder(
                  condition: state is! GetCourseLoadingState,
                  builder:(context)=>Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(flex:1,child: Text('Name',style: TextStyle(fontSize: 20,color: Colors.white),)),
                                Expanded(flex:1,child: Text('Video ',style: TextStyle(fontSize: 20,color: Colors.white),)),

                                Expanded(flex:1,child: Text('Available ',maxLines:1,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize: 20,color: Colors.white),)),


                                Expanded(
                                    flex:2,
                                    child: Text('Options',style: TextStyle(fontSize: 20,color: Colors.white)))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: ListView.separated(
                              itemBuilder:(context,index)=>BuiltItemRow(cubit.getCourseModel!.courses![index],cubit,context) ,
                              separatorBuilder:(context,index)=> SizedBox(height: 10,),
                              itemCount: cubit.getCourseModel!.courses!.length
                          ),
                        ),
                        SizedBox(width: 10,),
                        Row(
                          children: [
                            Spacer(),
                            BuiltContainerButton(
                                function: (){
                                  showDialog(context: context, builder: (context)=>
                                      Center(
                                        child: SingleChildScrollView(
                                          child: AlertDialog(
                                            elevation: 20,

                                            backgroundColor: Colors.white,
                                            iconPadding: EdgeInsets.all(0),
                                            contentPadding: EdgeInsets.all(10),

                                            title:BuiltContainerButton(function: (){

                                              cubit.AddCourse(
                                                  name: name.text,
                                                  desc: desc.text,
                                                  available: 'all',
                                                  image:cubit.imageData!
                                              );


                                            }, icon: Icons.add, text: 'Add Course'),
                                            content: Container(
                                              //   color: Colors.grey[300],
                                              child:Column(
                                                children: [
                                                  SizedBox(height: 10,),
                                                  BuiltTextField(
                                                      label: 'Name Course',
                                                      type: TextInputType.text,
                                                      controller: name,
                                                      prefix: Icons.title
                                                  ),
                                                  SizedBox(height: 10,),

                                                  BuiltTextField(
                                                      label: 'Description',
                                                      type: TextInputType.text,
                                                      controller: desc,
                                                      prefix: Icons.title
                                                  ),

                                                  SizedBox(height: 10,),
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
                                                  )
                                                  //Text('image'),
                                                  //Image.memory(cubit.uploadfile!,fit: BoxFit.fill,)


                                                ],
                                              ),
                                            ),
                                          ),

                                        ),
                                      )
                                  );
                                },
                                icon: Icons.add,
                                text: 'Add Course'
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  fallback: (context)=>Center(child: CircularProgressIndicator())
              )
          );
        },

      ),
    );
  }
  Widget BuiltContainerButton(
      {
        required  Function function,
        IconData? icon,
        required String text
      }
      ){
    return InkWell(
      onTap: (){
        function();
      } ,
      child: Container(
        height: 40,
        color: Colors.red,
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(icon,color: Colors.white,),
            //SizedBox(width:5 ,),
            Text(text,style:TextStyle(color: Colors.white) ,)
          ],
        ),
      ),
    );
  }

  Widget BuiltItemRow(Courses model,ProductCubit cubit,context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded( flex :1,child: Text('${model.name}',maxLines:1,overflow:TextOverflow.ellipsis,)),
          Expanded(flex :1,child: Text('${model.videosCount}')),
          Expanded(flex:1,child: Text('${model.forWhich}')),



          Expanded(
            flex: 2,
            child: Row(
              children: [

                Expanded(
                  flex: 1,
                  child: BuiltContainerButton(
                      function: (){
                        // CubitTeacher.get(context).DeleteExam(id:model.id!);
                      },
                      //   icon: Icons.delete,
                      text: 'Delete'
                  ),
                ),
                SizedBox(width: 5,),
                Expanded
                  (
                  flex: 1,
                  child: BuiltContainerButton(
                      function: (){
                        //   CubitParent.get(context).DeleteChildren(id:model.id!);
                        // cubit.ShowExam(id: 2);
                        //  navigatePush(context:context,widget: ShowExam(id:model.id!));
                      },
                      //  icon: Icons.slideshow_sharp,
                      text: 'Show'
                  ),
                ),

              ],
            ),
          )


        ],
      ),
    );
  }


}
