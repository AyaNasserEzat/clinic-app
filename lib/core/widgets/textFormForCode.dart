import 'package:clinic/core/utiles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFordCode extends StatelessWidget {
   TextFormFordCode({super.key,required this.controller5,required this.controller1,required this.controller2,required this.controller3,required this.controller4});
TextEditingController controller5=TextEditingController();
TextEditingController controller1=TextEditingController();
TextEditingController controller2=TextEditingController();
TextEditingController controller3=TextEditingController();
TextEditingController controller4=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColor.primary, width: 2)),
      height: 100,
      width: 500,
      child:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
             
              CodeInput(controller:controller1 ,),
              CodeInput(controller: controller2,),
              CodeInput(controller: controller3,),
              CodeInput(controller: controller4,),
               CodeInput(controller: controller5,),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeInput extends StatelessWidget {
   CodeInput({super.key,required this.controller});
TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      height: 52,
      width: 50,
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller:controller ,
        onChanged: (valu) {
          if (valu.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        onSaved: (newValue) {},
        decoration: InputDecoration(
    
          border: OutlineInputBorder(
            
            borderRadius: BorderRadius.circular(14)),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
