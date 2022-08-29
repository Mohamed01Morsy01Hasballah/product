import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Modules/Register.dart';
import 'package:products/cubit/CubitProducts.dart';
import 'package:products/cubit/Product.dart';
import 'package:products/cubit/StatesProducts.dart';

import 'Modules/Home.dart';
import 'Network/Remote/DioHelper.dart';

void main(){
runApp(MyApp());
WidgetsFlutterBinding.ensureInitialized();

DioHelper.init();
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>ProductCubit()..GetProduct()..GetGategory(),
     child: BlocConsumer<ProductCubit,ProductStates>(
        listener: (context,state){},
        builder: (context,state){

         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: ThemeData(
             scaffoldBackgroundColor: Colors.grey[300],
             appBarTheme: AppBarTheme(
               titleTextStyle: TextStyle(
                 fontSize: 19,
                 color: Colors.white,
               ),
               backgroundColor: Colors.deepOrange,
               centerTitle: true
             ),
           ),
           home: HomeScreen(),
         );
        },
      )
    );
  }

}