import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({this.text,this.onTap});
final text;
final onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular( 5), 
          color: Color(0xff909090),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal:25),
            child: Text( 
              text,
              style: TextStyle(
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
