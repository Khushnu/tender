


import 'package:flutter/material.dart';

actions(BuildContext context, String name, type){
    showDialog(context: context, builder: (context){
           Future.delayed(
            Duration(seconds: 1), (){
               Navigator.of(context).pop(true);
            }  
          );
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 60, vertical: 310),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('You ${type}  ${name}', style: TextStyle(color: Colors.black, fontSize: 18),), 
                  Container(
                    height: 40, 
                    width: 40, 
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: type == 'like'? Colors.green :Colors.red) ,
                    ),
                     child:  Icon( type == 'like' ?Icons.favorite : Icons.close))
                ],
              ),
            );
        });
}