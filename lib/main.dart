import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/Modules/New.dart';
import 'package:products/cubit/CubitProducts.dart';
import 'package:products/cubit/StatesProducts.dart';
import 'Modules/Home.dart';
import 'Network/Remote/DioHelper.dart';
import 'cubit/Product.dart';

void main()async {
runApp(MyApp());
WidgetsFlutterBinding.ensureInitialized();

await DioHelper.init();
}
class MyApp extends StatelessWidget{
  @override
  // productgit
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>ProductCubit(),
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
           home: CourseScreen(),
         );
        },
      )
    );
  }
// https://i.pravatar.cc
}