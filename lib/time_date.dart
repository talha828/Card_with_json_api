import 'package:flutter/material.dart';

class TimeAndDate extends StatelessWidget {
  TimeAndDate({this.title,this.text,});
final title;
final text;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text( title,style: TextStyle( color: Colors.grey.shade50,fontSize: 18),),
      SizedBox(width: 5,),
      Text( text,style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold,fontSize:18,)),
    ],);
  }
}



