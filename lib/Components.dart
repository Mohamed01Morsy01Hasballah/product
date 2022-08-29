
import 'package:flutter/material.dart';
import 'package:products/Modules/DetailsScreen.dart';

import 'models/ProductModel.dart';

Widget BuiltItem(ProductModel model,context){
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
          DetailsScreen(
              title: model.title,
              category: model.category,
              price: model.price,
              image: model.image,
            description: model.description,
          )
      ));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: 120,
                height: 120,
                child: Image(image: NetworkImage('${model.image}'))
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${model.title}',
                    maxLines: 3,
                    overflow:TextOverflow.ellipsis ,
                    style: TextStyle(
                        fontSize:15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Price : ${model.price}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.pink
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget BuiltTextField(
    {
      required String label,
      required TextInputType  type,
      required TextEditingController controller,
       IconData? prefix,
      IconData? suffix,
      validate,
      bool secure=false,
      suffixPressed,
      Function? onsubmit,

    }
    )=> TextFormField(
    keyboardType: type,
    controller:controller ,
    obscureText: secure,
    onFieldSubmitted:(s){
      onsubmit!(s);
    } ,
    decoration: InputDecoration(
        labelText:label,

        prefixIcon: Icon(
            prefix
        ),
        suffixIcon: TextButton(
          onPressed:suffixPressed ,
          child: Icon(
              suffix
          ),
        ),
        border:OutlineInputBorder()
    ),
    validator: validate
);
Widget BuiltButton(
    {
      required double height,
      required Color color,
      required String text,
      required  Function function,
    }
    )=>
    Container(
      width: double.infinity,
      height: height,
      color: color,
      child: MaterialButton(
        onPressed:(){
          function();
        },
        child: Text(text.toUpperCase()),

      ),
    );