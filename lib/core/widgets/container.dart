
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({super.key,required this.height,this.color,this.width,this.child});
 double height;
  double? width;
 Color? color;
 Widget?child;
  @override
  Widget build(BuildContext context) {
    return     Container(
                  height: height,
                  width: width,
                  decoration:  BoxDecoration(
                     border: Border.all(width: 6, color: Colors.white),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(55),
                      topRight: Radius.circular(55),
                      bottomLeft: Radius.circular(19),
                      bottomRight: Radius.circular(19),
                    ),
                    color:color,
                  ),
                  child: child,
                );      
  }
}